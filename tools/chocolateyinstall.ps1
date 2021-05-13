$ErrorActionPreference = 'Stop';

# Extract the msi from the exe with SYSPROReportingComponentsCR2013.exe /s /x /b"." /v"/qn"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'exe'
    silentArgs     = "/S /v/qn"
    url            = 'http://gold-images.int.celadonsystems.com/SYSPRO/CrystalRuntimes/SYSPROReportingComponentsCR2013.exe'
    checksum       = 'caf4facb77d66496f44ef99563cc43da6777dc9fc2e7f0b1778667293b858b6d'
    checksumType   = 'sha256'
}

# https://chocolatey.org/docs/helpers-install-chocolatey-install-package
#
Install-ChocolateyPackage @packageArgs
