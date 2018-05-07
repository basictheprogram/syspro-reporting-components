$ErrorActionPreference = 'Stop'; 

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation   = Join-Path $toolsDir 'SYSPROReportingComponentsCR2013.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  file          = $fileLocation
  softwareName  = 'syspro-reporting-components*'

  # Checksums are now required as of 0.10.0.
  #
  checksum      = 'caf4facb77d66496f44ef99563cc43da6777dc9fc2e7f0b1778667293b858b6d'
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
