# Name: RESX File consistency check
# author: Radek Zahradník (radek.zahradnik@msn.com)
# Date: 2018-10-16
# Version: 1.0
# Purpose: This script performs an automatic check
# of Medirecord RESX file check for consistency.
# Requires: -Version 5.0 -Modules ImportExcel, PowerShellGet
##########################################################################

####################################################
# Paths
####################################################
$path = "C:\Users\Radek\source\repos\medirecord\sources\MediRecord.Common\Properties"
$moduleName = 'ImportExcel'
####################################################


####################################################
# Elevate this script to admin priviledges
####################################################
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process powershell.exe "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
####################################################


####################################################
# Test the powershell version
####################################################
if ($PSVersionTable.PSVersion.Major -lt 5)
{
  # Not supported version
  Write-Error "Not supported version of PowerShell."
}

####################################################

####################################################
# Import module definition
####################################################
function Load-Module ($module) {
  # If module is imported say that and do nothing
  if (Get-Module | Where-Object {$_.Name -eq $module}) {
    write-host "Module $module is already imported."
  } else {
    # If module is not imported, but available on disk then import
    if (Get-Module -ListAvailable | Where-Object {$_.Name -eq $module}) {
      Import-Module $module -Verbose
    } else {
      # If module is not imported, not available on disk, but is in online gallery then install and import
      if (Find-Module -Name $module | Where-Object {$_.Name -eq $module}) {
        Install-Module -Name $module -Force -Verbose -Scope CurrentUser
        Import-Module $module -Verbose
      } else {
        # If module is not imported, not available and not in online gallery then abort
        write-host "Module $module not imported, not available and not in online gallery, exiting."
        EXIT 1
      }
    }
  }
}

Load-Module -module $moduleName
####################################################


####################################################
# Create a key row object
####################################################
class KeyRow
{
  # public Property
  [String]$Key
  [String]$English
  [String]$Czech
  [String]$Slovak
   
  # Constructor
  KeyRow()
  {
    # Constructor Code
    $this.Key = ""
    $this.English = ""
    $this.Czech = ""
    $this.Slovak = ""
  }
}
####################################################


####################################################
# Path check
####################################################
Function Select-FolderDialog
{
    param([string]$Description="Select Folder",[string]$RootFolder="Desktop")

  [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
     Out-Null     

   $objForm = New-Object System.Windows.Forms.FolderBrowserDialog
        $objForm.Rootfolder = $RootFolder
        $objForm.Description = $Description
        $Show = $objForm.ShowDialog()
        If ($Show -eq "OK")
        {
            Return $objForm.SelectedPath
        }
        Else
        {
            Write-Error "Operation cancelled by user."
        }
}
    
if (!(Test-Path -Path $path))
{
  $path = Select-FolderDialog # the variable contains user folder selection
}
####################################################


####################################################
# Reading RESX files
####################################################
$output = New-Object System.Text.StringBuilder(1000)
$list = New-Object System.Collections.ArrayList

if (Test-Path -Path $path)
{
  $restxFiles = Get-ChildItem -Path $path -Verbose -Filter *.resx | Sort-Object {$_.BaseName}

  [xml]$template = Get-Content -Path $restxFiles[0].FullName
  [xml]$czech = Get-Content -Path $restxFiles[1].FullName
  [xml]$slovak = Get-Content -Path $restxFiles[2].FullName
  
  # The start of the RESX file depended code
  $checkCzech = Compare-Object -ReferenceObject $template.root.data.Name -DifferenceObject $czech.root.data.Name
  $checkSlovak = Compare-Object -ReferenceObject $template.root.data.Name -DifferenceObject $slovak.root.data.Name
  $check = Compare-Object $checkCzech $checkSlovak -PassThru -IncludeEqual # union
  # The end of the RESX file depended code
  
  foreach ($restxString in $check)
  {
    $keyRow = [KeyRow]::new()
    
    $keyRow.Key = $restxString.InputObject
    # The start of the RESX file depended code
    $keyRow.English = $template.root.ChildNodes | Where-Object {$_.Name -eq $restxString.InputObject} | ForEach-Object {$_.value}
    $keyRow.Czech = $czech.root.ChildNodes | Where-Object {$_.Name -eq $restxString.InputObject} | ForEach-Object {$_.value}
    $keyRow.Slovak = $slovak.root.ChildNodes | Where-Object {$_.Name -eq $restxString.InputObject} | ForEach-Object {$_.value}
    # The end of the RESX file depended code
    $list.Add($keyRow) | Out-Null
  }
}
else
{
  Write-Error "The path: $path does not exist."
}
####################################################


####################################################
# Writing results in text form
####################################################
$list | Export-Excel -Path $PSScriptRoot\Differences.xlsx -ClearSheet -Show
####################################################
