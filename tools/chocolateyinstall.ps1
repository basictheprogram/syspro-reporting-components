$ErrorActionPreference = 'Stop';

# Extract the msi from the exe with SYSPROReportingComponentsCR2013.exe /s /x /b"." /v"/qn"
$data = & (Join-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path) -ChildPath data.ps1)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName  = $env:ChocolateyPackageName
    fileType     = 'msi'
    silentArgs   = "/qn /norestart"
    url          = $data.url
    checksum     = $data.checksum
    checksumType = $data.checksumType
}

# https://chocolatey.org/docs/helpers-install-chocolatey-install-package
#
Install-ChocolateyPackage @packageArgs
