# Name: WUG Přednáška Zlín/Ostrava
# author: Radek Zahradník (radek.zahradnik@msn.com)
# Date: 2019-10-17
# Version: 1.1
# Updated: v1.1 (2020-02-06)
# Purpose: This script is replacement for PowerPoint presentation
# which would be sooooooo boring. ;-)
##########################################################################

####################################################
# Představení přednášejícího
####################################################
Start-Process -FilePath 'www.radekzahradnik.cz/bio'

<# My love story s PowerShellem
- Léto 2014: CMD pro mne bylo sprosté slovo. Věděl jsem, že existuje PowerShell, ale to bylo tak vše.
  Nechápal jsem, jak v 21. století můžeme ještě koukat do nějaké 20 let staré černé obrazovky.
  Lidi na Linuxu s terminálem jsem úpřímně litoval.
- První rande: Podzim 2014 (slavíme tedy už 5 let známosti!)
- První nasazení na domácí automatizaci: Vánoce 2014
- První ostré pracovní nasazení ve správě IT: začátek 2015
- První automatizace pracovní agendy: Jaro 2015
- Kompletní automatizace domácí agendy: Podzim 2015
- Automatizace pracovní agendy: Jaro 2016
- První školení: Červen 2017
- Leden 2020: 1x školení s 1xx lidmi, základní a pokročilé.
- Asi nejlepší základní školení v ČR (minimálně pro .NET programátory)
#>

<# Let's have a threesome!
# 2014-2016 FEM Consulting: Automatizace správy IT
# 2016 GA Drilling: Virtualizace a správa výpočetního clusteru.
# 2017-2018 GINA: Pre/post build akce, automatizace úkolů
# 2018 Medirecord: Úkoly, související s hlavní aplikací, např. správa RESX souborů.
# 2019-doteď PurpleTechnology: Azure, deployment služeb.
#>
####################################################


####################################################
# Co je Powershell?
####################################################
<# Otázka pro publikum: Co je podle vás PowerShell?

Odpovědi, které nejčastěji slyším:
- Lepší příkazový řádek.
- Modrá příkazová řádka.
- Skriptovací jazyk.
- Skriptovací jazyk, co umožňuje opakovatelnost.
- Nové terminálové prostředí.
- Best of: "Nejlepší hackovací nástroj, co znám." (Disclaimer: Kali Linux neznal.)

#>
<# Co to tedy je?

# Česká wiki: PowerShell je rozšiřitelný textový shell se skriptovacím jazykem od společnosti Microsoft založený na .NET Frameworku.
- Poněkud zjednodušené.
- Zavádějící.

# Anglická wiki: PowerShell is a task automation and configuration management framework from Microsoft,
consisting of a command-line shell and associated scripting language.
- Obecnější, ale "trefná" definice.
- Vypadlo nám informace o ".NET Frameworku".

# Dobrá, dobrá a jak se to tedy má?
PowerShell je framework primárně pro automatizaci a správu IT založený na textovém terminálu a stejnojmenném skriptovacím jazyce,
který umožňuje rozšiřitelnost nad rámec původního záměru. Třeba ten hacking...
To jsme si řekli A, teď si ještě říci B...

#>
####################################################


####################################################
# Windows PowerShell vs. PowerShell Core
####################################################
<# Co je ovšem potřeba dodat...
v1.0.0.x 	| Listopad 	2006 	| Windows PowerShell 	| .NET Framework
v2.0.0.x 	| Říjen 	2009 	| Windows PowerShell 	| .NET Framework 3.5 (asi ???)
v3.0.0.x 	| Září 		2012 	| Windows PowerShell 	| .NET Framework 4.0
v4.0.0.x 	| Říjen 	2013 	| Windows PowerShell 	| .NET Framework 4.5
v5.0.0.x 	| Únor 		2016 	| Windows PowerShell 	| .NET Framework 4.5
v5.1.0.x 	| Leden 	2017 	| Windows PowerShell 	| .NET Framework 4.5
v6.0.0   	| Leden 	2018 	| PowerShell Core		| .NET Core v2.0.9
v6.1.0   	| Září 		2018 	| PowerShell Core		| .NET Core v2.1.13
v6.2.0   	| Březen 	2019 	| PowerShell Core		| .NET Core v2.1.13
v7.0.0 P4	| Září 		2019 	| PowerShell Core		| .NET Core 3.0
v7.0.0 RC2	| Leden 	2020 	| PowerShell Core		| .NET Core 3.0
#>
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/PowerShell%20Windows%20DLL%20dependency.png'
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/PowerShell%20Core.png'
Start-Process -FilePath 'https://4sysops.com/wiki/differences-between-powershell-versions/'
Start-Process -FilePath 'https://github.com/PowerShell/PowerShell/tags'
####################################################


####################################################
# Kde a jak začít?
####################################################
Start-Process -FilePath 'https://github.com/PowerShell/PowerShell' # 1. výsledek pokud zadáte do Google: PowerShell Core
Start-Process -FilePath 'https://github.com/janikvonrotz/awesome-powershell' # Pěkný Github rozcestník.
Start-Process -FilePath 'https://www.psconf.eu/' # Pěkná akce
Start-Process -FilePath 'http://shop.oreilly.com/product/0636920024491.do' # Už poněkud zastaralá kniha na dnešní téma.
####################################################


####################################################
# Pro začátek je dobré vědět následující...
####################################################
<# I will always remember
- PowerShell NeNí CaseSensitive.
- Příkazy PowerShellu se nazývají cmdlety.
- PowerShell se rozšiřuje do šířky pomocí modulů.
- | není svislítko, ale roura, alias pipeline, alias operátor zřetězení.
  Když se to neumí zřetězit, je to PowerScript, ne PowerShell.
- Proměnné se uvazují znakem $.
- PS => PowerShell
#>
$PSVersionTable.PSVersion
# PS v1.0 .. v5.1 => 10 let
# PS v1.0 obsahoval cca 120 cmdletů.
# PS v2.0 obsahoval cca 240 cmdletů.
# ps V5.1 obsahuje...
Write-Host ("Total number of commands: " + (Get-Command).Count)
Get-Module -ListAvailable
####################################################


####################################################
# Editory
####################################################
<# OK, PS je kúl, ale v čem to tedy budeme bouchat?
- VS Code
- ISE + ISESteroids
#>
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Write-Host "Installing VS Code..."
Start-Process powershell { choco upgrade vscode -y } -Wait
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Start-Process powershell { code --install-extension shan.code-settings-sync } -Wait
Start-Process powershell { code }
Write-Host "VS Code installed."
Write-Host 'Now, sync settings from cloud.'
Start-Process -FilePath 'https://marketplace.visualstudio.com/items/ms-vscode.PowerShell/changelog'
####################################################


####################################################
# Jak PS vlastně funguje?
####################################################
<# Klíčové koncepty:

Asi si někdo řekl:
"Pojďme vzít to, co funguje, ale udělejme to pořádně."
"S dokumentací..."
"...kterou navíc budeme aktualizovat, když něco změníme."
"In your face, Linux!"
A pak si asi řekli:
"Jsou to taky lidi, pojďme jim pomoci. Uděláme to i pro Linux."

CMD && UNIX => textový vstup | výstup
PS => Objektový vstup | výstup

Jelikož PS úzce spolehá na .NET, je postaven objektově.
Klíčový je koncept roury, která umožňuje snadné zřetězení programů.
Je to hlavní rozdíl, se kterým programátoři nejčastěji bojují,
protože vyžaduje trochu jiné postupy než na co jsme zvyklí.
Get-Service | Restart-Service

PS používá .NET pro své vnitřní fungování i běh. Dále využívá WMI.
WMI (Windows Management Instrumentation) je způsob, jakým Microsoft implementuje standard WBEM (Web-Based Enterprise Management), což je oborová iniciativa zaměřená na vývoj standardní technologie pro přístup k informacím správy v podnikovém prostředí. WMI používá k reprezentaci systémů, aplikací, sítí, zařízení a jiných součástí správy oborový standard CIM (Common Information Model). CIM vyvíjí a udržuje konsorcium DMTF (Distributed Management Task Force).
WBEM je oborová iniciativa, na kterou dohlíží konsorcium DMTF, jejímž cílem je vývoj standardizovaných neproprietárních prostředků pro přístup k informacím o správě a jejich sdílení v podnikové síti. Má zmírnit problémy, které jsou obvykle spojené se sběrem dat správy a diagnostických dat, kam můžou patřit různé typy hardwaru, protokolů, operačních systémů a distribuovaných aplikací.
CIM je rozšiřitelný, objektově orientovaný datový model, který obsahuje informace o různých částech podniku. Vývojář může prostřednictvím WMI použít model CIM k vytváření tříd, které představují jednotky pevného disku, aplikace, síťové směrovače nebo dokonce uživatelem definované technologie, jako je síťová klimatizace.
Rozhraní WMI je užitečné díky své schopnosti získávat data správy ze vzdálených počítačů. Vzdálená připojení rozhraní WMI zajišťuje model DCOM. Alternativou je Vzdálená správa Windows (WinRM), která získává data vzdálené správy rozhraní WMI pomocí protokolu WS-Management založeného na SOAP.
#>
Get-Help Get-WmiObject # Pouze na Windows PS
####################################################


####################################################
# Co nejlepší první krok s PS?
####################################################
{
	# Jednoduchá odpověď...
	Get-Help # Získáme nápovědu o nápovědě. Jediné, co je potřeba si opravdu pamatovat.

	# PS používá dva druhy nápovědy
	<# 1. #> Get-Help Get-Member # Nápověda pro konkrétní cmdlet. Je obsažena v kódu a formu si ukážeme později na příkladu.
	<# 2. #> Get-Help about_operators
	Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7'
}
####################################################


####################################################
# PS Provideři
####################################################
<# Abstrakce v praxi...

PS může pracovat s úložištěm souborů, registry, certifikáty atd.
Pokud byste ovšem hledali specifické cmdlety jako "New-File" nebo "New-Directory",
máte smůlu. Jak to?

PS zavádí abstrakci - PS Providers, která umožňuje abstrakci nad práci
s úložištěm, ať se tím myslí uložiště souborů nebo certifikátů.
PS Provider zprostředkovává určitou doménu.

#>
{
	# Paths
	$path = "$env:LOCALAPPDATA\Temp"
	$reg = 'HKCU:\Control Panel' # Cesta k registrům Windows, konkrétně HKEY_Current_User

	# Nalistování složek a souborů ze složky
	Get-ChildItem -Path $path

	# Nalistování složek a souborů včetně podsložek
	Get-ChildItem -Path $path -Recurse

	# Nalistování složek a souborů včetně podsložek
	Get-ChildItem -Path $path -Recurse -Verbose

	# Nalistování pouze složek
	Get-ChildItem -Path $path -Directory

	# Nalistování pouze složek včetně podsložek
	Get-ChildItem -Path $path -Directory -Recurse

	# Nalistování pouze souborů
	Get-ChildItem -Path $path -File

	# Nalistování pouze složek a jejich setřídění podle datumu posledního přístupu
	Get-ChildItem -Path $path -Directory | Sort-Object -Property LastWriteTimeUtc | Format-Table -Property LastWriteTime, Name

	# Nalistování pouze složek a jejich setřídění SESTUPNĚ podle datumu posledního přístupu
	Get-ChildItem -Path $path -Directory | Sort-Object -Property LastWriteTimeUtc -Descending | Format-Table -Property LastWriteTime, Name

	# Nalistování pouze souborů a jejich setřídění podle datumu posledního přístupu
	Get-ChildItem -Path $path -File | Sort-Object -Property LastWriteTimeUtc | Format-Table -Property LastWriteTime, Name

	# Nalistování pouze souborů a jejich setřídění SESTUPNĚ podle datumu posledního přístupu
	Get-ChildItem -Path $path -File | Sort-Object -Property LastWriteTimeUtc -Descending | Format-Table -Property LastWriteTime, Name

	# Get-ChildItem jako jeden z mála cmdletů podporuje přímo filtrování skrze parametry, tj. -Filter
	Get-ChildItem -Path $path -File -Filter *SomeFilter*

	# Nalistování složek z registru a uložení do proměnné
	$podsložky = Get-ChildItem -Path $reg

	# Test, zda podsložky obsahují podsložku s přesným názvem Accessibility
	if (Test-Path "$reg\Accessibility")
 {
		Write-Verbose -Message 'Accessibility je tam.'
	}
	# Alternativa
	if ($podsložky[0..($podsložky.Count - 1)].Name -like 'Accessibility')
 {
		Write-Verbose -Message 'Accessibility je tam.'
	}

	# Nalistování klíčů z registru
	Get-ItemProperty -Path "$reg\Colors"

	# Zjištění konkrétní hodnoty klíče z registru
	Get-ItemProperty -Path "$reg\Colors" -Name ActiveBorder

	# Příkazy, které máme k dispozici pro "položky".
	Get-Command -Noun Item

	# Příkazy, které máme k dispozici pro práci s vlastnostmi položek.
	Get-Command -Noun ItemProperty
}
####################################################


####################################################
# Proudy (Write cmdlety)
####################################################
{
	# V PS jsou k dispozici různé způsoby zápisu:
	Get-Command -Verb "Write" -Module Microsoft.PowerShell.Utility # Různé formy zápisu.
	Write-Output "Zpráva" # Zápis do výstupního proudu, zpravidla konzole.
	Write-Host "Zpráva" # Zápis hlášení na hostitele (může být vzdálený).
	Write-Error "Zpráva" # Zapíše se chybového hlášení do konzole
	Write-Warning "Zpráva" # Zapíše se varování do konzole
	Write-Information "Zpráva" # Zapíše se informační hlášení do konzole
	Write-Verbose "Zpráva" # Zapíše se informační hlášení do konzole, dostupné pouze pro příznak -Verbose
	Write-Debug  "Zpráva" # Zapíše se debug hlášení do konzole, dostupné pouze pro příznak debug.
	# Write-Debug způsobuje confirm

	# Každý proud má své nastavení chování
	$VerbosePreference = [System.Management.Automation.ActionPreference]::SilentlyContinue    # Použití enumu, který zajistí ochranu před typo chybou.
	$InformationPreference = [System.Management.Automation.ActionPreference]::Continue
	$DebugPreference = "SilentlyContinue"                                                     # Použítí běžného stringu, který si PS sám převede.
	$ProgressPreference = [System.Management.Automation.ActionPreference]::Continue
	$WarningPreference = "Continue"
	$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop
}
####################################################


####################################################
# Gong pro 2. polovinu
####################################################
for ($x = 1000; $x -lt 15000; $x += 300)
{
  "Frequency $x Hz"
  [Console]::Beep($x, 500)
}
####################################################


####################################################
# Co může překvapit .NET programátora?
####################################################
<# Dvojité vs. jednoduché uvozovky

PS pro stringy používá 'SomeString' a "SomeString".

Jednoduché uvozovky 'SomeString' je string literál => konstantní string.
Dvojité uvozovky "SomeString with $someVariableName" je interpolovaný string.
#>
{
	$aString = "Some string"
	$bString = 'Some string b' # Zcela ekvivalentní s řádkem výše, ale...
	$cString = '$bString' # Výsledkem je vypsání textového řetěžce '$bString'
	$dString = "$bString"  # Výsledkem je vypsání textového řetěžce 'Some string b'
	$cString = 'Explictiní určení stringu' # Do hodnoty se vepíše přesně to, co je mezi ''
	$dString = "Implicitní určení stringu" # PS kontroluje, zda mezi "" není nějaký název proměnné.
}

# Použití roury i tam, kde by .NET programátor nepoužil
{
	$path = "$env:APPDATA\SomeFolder"

	if (Test-Path -Path $path)
 {
		<# alá .NET programátor#>
 }
	if ($path | Test-Path)
 {
		<# alá PS programátor #>
 }
}

# Konstrukce smyček for, foreach
{
	$test = 1..10
	$test
	foreach ($number in $test)
 {
		$number * 10
	}
	# Většina smyček se v PS dá nahradit rourou na jeden řádek.
	$test = $test | ForEach-Object { $_ * 10 } # 1 * 10, 2 * 10 ...

	# Hezké, ale tak nějak C# než PS.
	$softwareCollection = @('firefox', 'MPC-HC', 'VLC', 'Dropbox')
	foreach ($software in $softwareCollection)
 {
		choco upgrade $software -y
	}

	foreach ($process in Get-Process) {

	}
	Get-Process | ForEach-Object {<#...#>}

	# Stejně hezké a čistý PS.
	@('firefox', 'MPC-HC', 'VLC', 'Dropbox') |
	ForEach-Object { choco upgrade $_ -y }

	# Jediné, kde smyčky dávají smysl, je práce s členskými proměnnými.
	foreach ($process in Get-Process)
 {
		$process.Company #... nějaké složité operace s členskými proměnnými.
	}


	# Pozor na některé kolekce
	$test
	$test = @{Key1 = 1; Key2 = 2 }
	$test
	$test = $test | ForEach-Object { $_.Value * 10 } <# Násobíme NULL desítkou, hashtable prochází jako celek. #>
}

# Kontrola proměnné na null
if ($test)
{

}

# Zalomení konce řádků
{
	# PS intepretuje dva řádky, kde na každém řádku je
	# jeden příkaz, jako dva samostatné příkazy.
	# Pokud máme dlouhý příkaz zřetězení skrze rouru (ALTGr+W)
	# viz další výklad, můžeme zalomit řádek Enterem.
	# V tu chvíli PS interpretuje příkaz jako jeden.
	Get-Service |
	Where-Object -Property Status -eq 'Running' |
	Format-Table Name, DisplayName -AutoSize

	# Pro zalomení jednoho řádku na dva příkazy lze
	# použít středník (;) mezi příkazy. V tu chvíli je
	# to to samé, jako kdyby příkazy byly každý na
	# samostatném řádku.
	$someVariable = 10; $someVariable = 11
	# to samé jako
	$someVariable = 10
	$someVariable = 11

	# Pro zalomení dlouchých cmdletů můžeme použít znak
	# ` - vážný přízvuk Alt+96
	New-Item -Path HKLM:\SOFTWARE\Microsoft\DVDNavigator\ `
		-Name 'TestKey' `
		-Value 0
}

# Konstrukce funkcí
{
	# Povinný formát Verb-Noun
	Start-Process -FilePath "https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7"

	# Sekci parametrů i samotné parametry můžeme rozsáhle dekorovat atributy, viz příklady na konci tohoto skriptu.
	function Verb-Noun
 {
		[CmdletBinding()]
		param (
			# Obsáhlý popis parameterů
		)

		begin
		{

		}

		process
		{

		}

		end
		{

		}
	}
}
# Validate paramterů na datový typ se provádí jako první
# PS provede převedení vstupní hodnoty (např. string) na datový typ natvrdo a teprve potom kontroluje dle atributů.
# Problém přdevším v národnostním formátování, např. desetinný oddělovač.

# Konstrukce tříd
{
	# PS 5.x a vyšší.
	class Foo
 {
		# Konstruktory
		Foo([String]$alias, [Int32]$hitPoints)
		{
			#$Alias = $alias # Tohle neklapne, this je povinný.
			$this.Alias = $alias
			$this.HitPoints = $hitPoints
		}
		# Na nějakou pěknou pomoc ze strany IDE při inicializaci vlastností můžeme zapomenout.
		# Třídy v module jsou obecně spíše problém, protože nejsou exportovány ven, musí se jim dělat ruční dokumentace.
		# To už je jednodušší použít PS SDK a napsat to C#.

		# Veřejné vlastnosti
		[String] $Alias
		[Int32] $HitPoints

		# Statické vlastnosti
		static [String] $Clan = "WUG"

		# Skryté vlastnosti
		hidden [String] $RealName
	}
	# Jak vymlátit custom třídy z modulu?
	# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes?view=powershell-6#importing-classes-from-a-powershell-module
	# https://stackoverflow.com/questions/31051103/how-to-export-a-class-in-powershell-v5-module

	# Novou instanci Foo vyrobíme takto:
	$fooBarInstance = [FooBar]::new("fb",10)

	# Chcete vlastní gettery a settery? No nebude se vám to asi líbit...
	class FooBar
 {
		hidden [string]$_prop1

		FooBar()
		{
			$this | Add-Member -Name Prop1 -MemberType ScriptProperty -Value {
				# This is the getter
				return $this._prop1
			} -SecondValue {
				param($value)
				# This is the setter
				If ($value -eq 'foo')
				{
					$value = 'bar'
    }
				$this._prop1 = $value
			}
		}
	}
	$FooBarInstance = [FooBar]::new()
	$FooBarInstance.Prop1 = 'Egon Spenglar'

	# Alternativa pro Windows PowerShell:
	Add-Type -Language CSharpVersion3 -TypeDefinition @"
    public class Person
    {
        public Person() {}

        public string First { get; set; }
        public string Last { get; set; }
    }
"@
}

# Konstrukce generických kolekcí
{
	$list = New-Object 'System.Collections.Generic.List`1[Int32]' # Není úplně typově bezpečné.
	$list = New-Object -TypeName ([System.Collections.Generic.List`1[Int32]]) # Všimněte si triku se (), typově bezpečnější.
	# `1 znamená jeden typ na vstupu, stejné jako List<Int32>.

	# Obecně lze často vidět [typo]vě nebepečné použití stringu u definice názvu typu, oboru názvů nebo hodnoty enumu.
	Get-ChildItem -Path C:\Temp -ErrorAction 'SilentlyContinue' 	# Takto to napíše jenom hovado.
	Get-ChildItem -Path C:\Temp -ErrorAction SilentlyContinue # Mnohem lepší a rychlejší.
	Get-ChildItem -Path C:\Temp -ErrorAction:SilentlyContinue # Mnohem lepší a rychlejší.
}

# Sémantika návratových hodnot je v PS taková divná...
{
	Start-Proces -FilePath "https://stackoverflow.com/a/10288256/4553982"

	$a = "Hello, WUG!"
	return $a

	# Když už a existuje, můžeme také takto
	$a
	return

	# nebo jenom
	$a
	# jako poslední řádek cmdletu nebo skriptu.

	# Pak nesmíme zapomenout na možnost:
	Write-Output -InputObject $a

	# Všechny tyto způsoby jsou ekvivalentní, redundatní.
	# Za sebe doporučuji první a poslední možnost.
}

# Rozdělení stringů (PS vs. .NET)
{
	$a -split '\r?\n' # rozdělí $a na řádky nehledě na to o jaký typ zalomení (CRLF nebo LF)
	$a.Split('\r\n')  # Musí se brát v potaz jiný způsob eskejpování znaků.

	$test = "\r\nasdf\r\nasdfasfd"
	$test.Split('\r\n')
	<# Výstup:

	asdf

	asdfasfd
	#>
	$test.Split('`r`n')
	<# Výstup:
	\
	\
	asdf\
	\
	asdfasfd
	#>
}
# ... a vůbec, pojďme se pobavit o operátorech v PS

# Operátory
{
	# Přiřazení
	!($true) 	# Tady veškerá podobnost syntaxe končí.
	$foo = "foo"
	if(!$foo){$true} <#Ekvivalent $foo != null#>

	1 -eq 2 	# equal
	1 -gt 2  	# greater than
	1 -ge 2  	# greater equal
	-not 1		# negace alá PS
	-not $foo


	# V PS jsou smotány všechny operátory dohromady, do textové podoby: pomlčka (technicky vzato je to spojovník) + textová podoba toho, co chci.

	# Ternární operátor lze realizovat takto:
	$result = If ($condition)
 {
		"true"
 }
 Else
 {
		"false"
 }
	write-host  $(If ($condition)
		{
			"true"
		}
		Else
		{
			"false"
		})
}

# Konstrukce GUI skrze Winforms
{
	# Přípojení systémové knihovny Windows.Forms.
	Add-Type -AssemblyName System.Windows.Forms
	$form = New-Object -TypeName system.Windows.Forms.Form # vytvoření nové formy (dialogu)
	$form.Text = 'Some new title'
	$label = New-Object -TypeName System.Windows.Forms.Label # vytvoření nové textového štítku
	$label.Text = 'Hello world!'
	$label.AutoSize = $true
	$label.Location = New-Object -TypeName Drawing.Point -ArgumentList 5, 10
	$button = New-Object -TypeName Windows.Forms.Button # vytvoření nového prvku typu button
	$button.Text = 'OK'
	$button.Location = New-Object -TypeName Drawing.Point -ArgumentList 5, 30
	$form.Controls.Add($label)
	$form.Controls.Add($button)
	$form.ShowDialog()
}

# Další příklad GUI
{
	# Přípojení potřebných knihoven na vytvoření objektů
	Add-Type -AssemblyName System.Windows.Forms
	Add-Type -AssemblyName System.Drawing
	# Vytvoření nového formuláře
	$form = New-Object Windows.Forms.Form
	# Nastavení vlastnostní formuláře
	$form.Text = 'Select a Date'
	$form.Size = New-Object Drawing.Size @(243, 230)
	$form.StartPosition = 'CenterScreen'
	# Vytvoření nového objektu kalendáře ze stejné Forms knihovny
	$calendar = New-Object System.Windows.Forms.MonthCalendar
	$calendar.ShowTodayCircle = $false
	$calendar.MaxSelectionCount = 1
	$form.Controls.Add($calendar) # Přidání objektu kalendáře na formulář
	# Nový objekt tlačítka OK
	$OKButton = New-Object System.Windows.Forms.Button
	$OKButton.Location = New-Object System.Drawing.Point(38, 165) # Definice kde se má kreslit.
	$OKButton.Size = New-Object System.Drawing.Size(75, 23) # Definice jak má být veliké.
	$OKButton.Text = 'OK'
	$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
	$form.AcceptButton = $OKButton
	$form.Controls.Add($OKButton) # Přidání do kolekce prvků, které se budou kreslit ve formuláři.

	$CancelButton = New-Object System.Windows.Forms.Button
	$CancelButton.Location = New-Object System.Drawing.Point(113, 165)
	$CancelButton.Size = New-Object System.Drawing.Size(75, 23)
	$CancelButton.Text = 'Cancel'
	$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
	$form.CancelButton = $CancelButton
	$form.Controls.Add($CancelButton)

	$form.Topmost = $true  # Vykreslit úplně navrchu, tak, aby okno nebylo překryté ničím jiným.

	$result = $form.ShowDialog() # Vykreslení na obrazovku
	# Kontorla, zda vrácený výsledek z formy je stisk tlačítka OK
	if ($result -eq [System.Windows.Forms.DialogResult]::OK)
 {
		$date = $calendar.SelectionStart
		Write-Host "Date selected: $($date.ToShortDateString())"
	}
}

# XAML GUI
Lze vyrábět i pokročilejší rozhraní skrze XAML
# Dobrý a prodrobný návod lze najít zde:
Start-Process -FilePath "https://www.gngrninja.com/script-ninja/2016/12/23/powershell-configure-your-scripts-with-a-gui"
# WPF
# WPF použití spočívá v tom, že v libovolném XAML designéru
# navrhneme GUI a poté zkopírujeme XAML kód z designéru
# do PS. Zde z něj vyrobíme XML a použijeme jako formulář.
{
	function Invoke-GUI
 {
		#Begin function Invoke-GUI
		[cmdletbinding()]
		Param()

		[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
		[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')

		$inputXML = @"
<Window x:Class="psguiconfig.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:psguiconfig"
        mc:Ignorable="d"
        Title="Script Configuration" Height="281.26" Width="509.864">
    <Grid>
        <Label x:Name="lblWarningMin" Content="Warning Days" HorizontalAlignment="Left" Height="29" Margin="10,6,0,0" VerticalAlignment="Top" Width="86"/>
        <TextBox x:Name="txtBoxWarnLow" HorizontalAlignment="Left" Height="20" Margin="96,6,0,0" TextWrapping="Wrap" Text="0" VerticalAlignment="Top" Width="27"/>
        <Label x:Name="lblDisableMin" Content="Disable Days" HorizontalAlignment="Left" Height="29" Margin="134,6,0,0" VerticalAlignment="Top" Width="86"/>
        <TextBox x:Name="txtBoxDisableLow" HorizontalAlignment="Left" Height="20" Margin="220,6,0,0" TextWrapping="Wrap" Text="0" VerticalAlignment="Top" Width="27"/>
        <TextBox x:Name="txtBoxOUList" HorizontalAlignment="Left" Height="153" Margin="10,54,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="479" AcceptsReturn="True" ScrollViewer.VerticalScrollBarVisibility="Auto"/>
        <Label x:Name="lblOUs" Content="OUs To Scan" HorizontalAlignment="Left" Height="26" Margin="10,28,0,0" VerticalAlignment="Top" Width="80"/>
        <Button x:Name="btnExceptions" Content="Exceptions" HorizontalAlignment="Left" Height="43" Margin="252,6,0,0" VerticalAlignment="Top" Width="237"/>
        <Button x:Name="btnEdit" Content="Edit" HorizontalAlignment="Left" Height="29" Margin="10,212,0,0" VerticalAlignment="Top" Width="66"/>
        <Button x:Name="btnSave" Content="Save" HorizontalAlignment="Left" Height="29" Margin="423,212,0,0" VerticalAlignment="Top" Width="66"/>
    </Grid>
</Window>
"@

		[xml]$XAML = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'

		#Read XAML
		$reader = (New-Object System.Xml.XmlNodeReader $xaml)
		try
		{

			$Form = [Windows.Markup.XamlReader]::Load( $reader )

		}

		catch
		{

			Write-Error "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."

		}

		#Create variables to control form elements as objects in PowerShell
		$xaml.SelectNodes("//*[@Name]") | ForEach-Object {

			Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name) -Scope Global

		}

		#Show form
		$form.ShowDialog() | Out-Null

	}

	#Call function to open the form
	Invoke-GUI

}
####################################################


####################################################
# Použití nuget balíčků z nuget.org
####################################################
Install-Package UltimateTemperatureLibrary -source https://www.nuget.org/api/v2
Unregister-PackageSource -Source nuget.org
Register-PackageSource -Location https://www.nuget.org/api/v2 -name nuget.org -Trusted -ProviderName NuGet
####################################################


####################################################
# Proč se zajímat o PS jako .NET programátor?
####################################################
{
	# Nepřípomíná vám Package Management konzola ve Visual Studiu něco?
	Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Images/Package%20Manager%20Console.png'

	# Testování konzolé aplikace se vstupem od uživatele
 {
		$process = New-Object System.Diagnostics.Process
		$process.StartInfo.FileName = ".\ConsoleApp1.exe"
		$process.StartInfo.UseShellExecute = $false
		$process.StartInfo.RedirectStandardOutput = $true
		$process.StartInfo.RedirectStandardInput = $true
		if ( $process.Start() )
		{
			# input
			$process.StandardInput.WriteLine("1");
			$process.StandardInput.WriteLine("2");
			$process.StandardInput.WriteLine("3");
			$process.StandardInput.WriteLine();
			$process.StandardInput.WriteLine();
			# output check
			$output = $process.StandardOutput.ReadToEnd()
			if ( $output )
			{
				if ( $output.Contains("sum 6") )
				{
					Write-Output "pass"
				}
				else
				{
					Write-Error $output
				}
			}
			$process.WaitForExit()
		}
	}

	# Ach to GUI...
	{
		Clear-Host
		$Pat = 'bfj426gnboivwwgblyhvis3dvzzamq67euoxioi4agasjl4h2cwa'
		$cred = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$PAT"))
		$Organization = 'Microsoft'
		$ProjectName = 'Něco%20Na%20Smazani'

		$GetUri = "https://feeds.dev.azure.com/$Organization/$ProjectName/_apis/packaging/feeds?api-version=6.0-preview.1"
		$GetFeeds = "https://feeds.dev.azure.com/$Organization/$ProjectName/_apis/packaging/feeds?api-version=6.0-preview.1"
		$DelUri = "https://feeds.dev.azure.com/$Organization/$ProjectName/_apis/packaging/feedrecyclebin/7d280a9f-1232-492d-ac7b-de7db7642f77?api-version=6.0-preview.1"
		$GetUsersUri = "https://vssps.dev.azure.com/$Organization/_apis/graph/users?api-version=6.0-preview.1"

		$json = Invoke-RestMethod -ContentType "application/json" -Method 'Get' -Uri $GetUsersUri -Headers @{Authorization = "Basic $cred" }
		Write-Host 'Completed'
		$json.value | Out-File -FilePath C:\Temp\Test.txt
		#Invoke-RestMethod -ContentType "application/json" -Method 'Delete' -Uri $DelUri -Headers @{Authorization = "Basic $cred"}
	}
}
####################################################


####################################################
# Kdy PowerShell použít jako .NET programátor?
####################################################
<#
- PS má totiž jednu velkou výhodu: výkonný = zdrojový kód. Mohu se rovnou podívat, co se děje uvnitř.
- Primárně nahrazení konzolovky, kde každá změna => rekompilace.
- Není potřeba/možnost pro speciální IDE pro debuging.
- Potřebuji zaregistrovat službu v systému.
- Potřebuji něco fixnout v Azure/Azure DevOps, protože GUI má chybu, např. odebrání private feedu, práva uživatelů
- PS skript zvládne hravě schopnosti konzolových aplikací. Dokud neexistoval DragonFruit, byl to i lepší způsob díky lepší validaci parametrů. (https://www.hanselman.com/blog/DragonFruitAndSystemCommandLineIsANewWayToThinkAboutNETConsoleApps.aspx)
#>
####################################################


####################################################
# Kdy PowerShell nepoužít jako .NET programátor?
####################################################
<#
- Složitější GUI
- Potřebuji rozsáhleji pracovat s třídami.
- Když potřebuji dědičnost a protected.
- Nerozdýchám absenci rozhraní.
#>
####################################################


####################################################
# Příklad č.1: Správa RESX souborů
####################################################
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Examples/MR%20RESX%20files%20check.ps1'
####################################################


####################################################
# Příklad č.2: Rozšiřující modul PS
####################################################
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-Subtitle-Module/blob/master/Subtitle/Subtitle.psm1'
####################################################


####################################################
# Příklad č.3: Hlídací pes
####################################################
Start-Process -FilePath 'https://github.com/KUTlime/PowerShell-pohledem-dotNET-programatora/blob/master/Examples/WebCronScheduled.ps1'
####################################################

<# Nějaké snippety do VS Code, co se můžou hodit...

	"Script header": {
		"prefix": ["header", "script-header"],
		"body": [
			"# Name: $1",
			"# author: Radek Zahradník (radek.zahradnik@msn.com)",
			"# Date: $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE",
			"# Version: 1.0",
			"# Purpose: This script performs an $2",
			"##########################################################################",
			"",
			"####################################################",
			"# Paths",
			"####################################################",
			"$0",
			"####################################################"
		],
		"description": "A header for script description."
	  },

	  "Code block": {
		"prefix": ["code", "code-block"],
		"body": [
			"####################################################",
			"# ${1:Block description}",
			"####################################################",
			"${2:Code goes here}",
			"####################################################",
		],
		"description": "A code block for nice and easy scripting."
	  },

	  "Get Admin priviledges": {
		"prefix": ["Get-AdminPriviledges", "Get-admin"],
		"body": [
			"####################################################",
			"# Elevate this script to admin priviledges",
			"####################################################",
			"if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process powershell.exe \"-ExecutionPolicy Bypass -File `\"$PSCommandPath`\"\" -Verb RunAs; exit }",
			"####################################################"
		],
		"description": "A code block for nice and easy scripting."
	  }

#>