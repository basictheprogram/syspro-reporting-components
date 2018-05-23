$ErrorActionPreference = 'Stop'; 

# Extract the msi from the exe with SYSPROReportingComponentsCR2013.exe /a /b "."

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation   = Join-Path $toolsDir 'SYSPROReportingComponentsCR2013.msi'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI' 
  file          = $fileLocation
  softwareName  = 'syspro-reporting-components*'

  # Checksums are now required as of 0.10.0.
  #
  checksum      = '23983d11ba2503779d39f86af0b736747af7b9e86d56de966dd2e622c1078d92'
  checksumType  = 'sha256'

  # Cygwin $env:TEMP is C:\tools\cygwin\tmp\chocolatey
  # Powershell $env:TEMP is C:\Users\tanner\AppData\Local\Temp
  #
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).log`""
  validExitCodes = @(0, 3010, 1641)
}

# https://chocolatey.org/docs/helpers-install-chocolatey-install-package
#
Install-ChocolateyInstallPackage @packageArgs 
