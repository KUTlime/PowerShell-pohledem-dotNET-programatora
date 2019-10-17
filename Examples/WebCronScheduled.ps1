# Name: Web difference checker
# author: Radek Zahradník (radek.zahradnik@msn.com)
# Date: 2019-02-24
# Version: 1.0
# Purpose: This script performs an automatic check for
# change of the webpage and sends the email notification
# if some change is found
##########################################################################


####################################################
# PS usings
####################################################
Add-Type -AssemblyName Microsoft.PowerShell.Commands.Utility
####################################################

####################################################
# Function definitions
####################################################

function Invoke-WebRequestInAzure
{
  [OutputType([Microsoft.PowerShell.Commands.BasicHtmlWebResponseObject])]
  #Content
  param
  (
    [String]
    [Parameter(Mandatory=$True,HelpMessage='Add an valid URL')]
    $Url
  )
  [Net.ServicePointManager]::SecurityProtocol = 'tls12, tls11, tls'
  $ProgressPreference="SilentlyContinue"
  $request = Invoke-WebRequest -Uri $Url -UseBasicParsing 
  $ProgressPreference = "Continue"
  [Console]::WriteLine("Invoking a basic webrequest to $Url")
  return $request
}

function Write-RequestContent
{
  #Content
  Param
  (
    # Input Microsoft.PowerShell.Commands.BasicHtmlWebResponseObject
    [Parameter(Mandatory=$true,
        HelpMessage='Add a valid request', 
        ValueFromPipeline=$true,
        ValueFromRemainingArguments=$false,
        Position=0
    )]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Commands.BasicHtmlWebResponseObject]
    $Request,
    # Input Microsoft.PowerShell.Commands.BasicHtmlWebResponseObject
    [Parameter(Mandatory=$true,
        ValueFromPipeline=$true,
        HelpMessage='Add a valid request',
        Position=1
    )]
    [ValidateNotNull()]
    [String]
    $FileName
  )
  [Console]::WriteLine("Writing the content to file $fileName")
  $Request.Content | Out-File -FilePath $FileName -Encoding unicode -Force
}

function Get-Body
{
  [OutputType([String])]
  #Content
  Param
  (
    # HTML string
    [Parameter(Mandatory=$true,
        HelpMessage='Add a valid HTML string', 
        Position=0
    )]
    [ValidateNotNull()]
    [String]
    $Website
  )
  
  $splittedHTML = $Website.Split(@("<body","</body>"),[StringSplitOptions]::None)

  if ($splittedHTML.Count -ne 3)
  {
    # Content
    [Console]::WriteLine("The body split error.")
    Exit 1
  }
  [Console]::WriteLine("Returing <body>, the preview: " + ($splittedHTML[1])[0..10] )
  return $splittedHTML[1]
}

function Get-Availability
{
  [OutputType([String])]
  #Content
  Param
  (
    # HTML string
    [Parameter(Mandatory=$true,
        HelpMessage='Add a valid HTML string', 
        Position=0
    )]
    [ValidateNotNull()]
    [String]
    $Body
  )
  
  $splittedHTML = $Body.Split(@("<div class=`"availability"),[StringSplitOptions]::None)
  if($splittedHTML.Count -eq 1)
  {
    [Console]::WriteLine("An availability split should return more than one object.")
    Exit 2
  }
  
  $availability = $splittedHTML[1].Split(@('</div>'),[StringSplitOptions]::None)
  
  if($availability.Count -eq 1)
  {
    [Console]::WriteLine("An </div> split should return more than one object.")
    Exit 3
  }
  
  [Console]::WriteLine('The final spliting object:')
  [Console]::WriteLine($availability[0])
  
  return $availability[0]
}

function Find-Differences
{
  [OutputType([Object[]])]
  #Content
  Param
  (
    # Template string
    [Parameter(Mandatory=$true,
        HelpMessage='Add a valid template string', 
        Position=0
    )]
    [ValidateNotNull()]
    [String]
    $Template,
    # Current string
    [Parameter(Mandatory=$true,
        HelpMessage='Add a valid request',
        Position=1
    )]
    [ValidateNotNull()]
    [String]
    $Current
  )
  
  $TemplateContent = Get-Availability -Body (Get-Body -Website $Template)
    
  $CurrentContent = Get-Availability -Body (Get-Body -Website $Current)
  
  
  $differences = Compare-Object -ReferenceObject ($TemplateContent.Split(@('</span>'),[StringSplitOptions]::None)) -DifferenceObject ($CurrentContent.Split(@('</span>'),[StringSplitOptions]::None))

  return $differences
}
####################################################


####################################################
# Paths
####################################################
#$url = 'https://www.radekzahradnik.cz/bio'
$templateName = 'Template.txt' 
$currentName = 'Current.txt'
$url = 'https://www.lepsinalada.cz/gin/hvozd-gin/'
####################################################


####################################################
# Email setup
####################################################
$emails = @('Me <me@gmail.com>','Me <me@gmail.com>','Me <me@gmail.com>')
$userName = 'me@gmail.com'
$password = "" | ConvertTo-SecureString -asPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential($userName,$password)
####################################################


####################################################
# Template setup
####################################################
if ((Test-Path -Path "$PSScriptRoot\$templateName") -eq $false)
{
  Invoke-WebRequestInAzure -Url $url | Write-RequestContent -FileName $templateName
}
####################################################


####################################################
# Get the template
####################################################
$template = Get-Content -Path $templateName
####################################################


####################################################
# Search for modification
####################################################
Invoke-WebRequestInAzure -Url $url | Write-RequestContent -FileName $currentName

Write-Output (Get-ChildItem $PSScriptRoot)

$currentStateContent = Get-Content -Path 'Current.txt'

$difference = Find-Differences -Template ([String]::Join('',$template)) -Current ([String]::Join('',$currentStateContent))

if ($difference -ne $Null)
  {
    Write-Output ("The number of differences: " + $difference.Count)
    
    Write-Output -Message "Writing a new template."
    Move-Item -Path $currentName -Destination $templateName -Force -Verbose
        
    $stringBuilder = New-Object -TypeName System.Text.StringBuilder
    $stringBuilder.AppendLine("The modification has been found on URL: $url") | Out-Null
    $stringBuilder.AppendLine("Number of changes: " + $difference.Length) | Out-Null
    for ($i = 1; $i -le $difference.Count; $i++) 
    {
      $stringBuilder.AppendLine("Change number $i") | Out-Null
      $stringBuilder.AppendLine("----------Start of change----------") | Out-Null
      $stringBuilder.AppendLine($difference[$i].InputObject) | Out-Null
      $stringBuilder.AppendLine("----------End of change----------") | Out-Null
      $stringBuilder.AppendLine('') | Out-Null
    }

    foreach ($email in $emails)
    {
      Send-MailMessage -Subject "Time to buy" -From "Radek Zahradník <$userName>" -To $email -Body $stringBuilder.ToString() -SmtpServer "smtp.live.com" -Encoding Unicode -UseSsl -Port 587 -Credential $credentials
    }
    $stringBuilder.Clear()
  }
  else
  {
    Write-Output "Nothing found."
  }
####################################################


