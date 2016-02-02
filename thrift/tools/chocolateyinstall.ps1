
$ErrorActionPreference = 'Stop';

$packageName   = 'thrift'
$version       = '0.9.3'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url           = "http://mirrors.rackhosting.com/apache/thrift/$version/thrift-$version.exe"
$url64         = $url
$fileType      = 'exe'
$checksum      = 'd373614a4fac5cf0aff1340dfe630acb'
$checksumType  = 'md5'
$checksum64    = $checksum
$checksumType64= $checksumType

Write-Debug "Running 'Install-ChocolateyStandalone' for $packageName with url:`'$url`', url64bit: `'$url64bit`', specificFolder: `'$specificFolder`', checksum: `'$checksum`', checksumType: `'$checksumType`', checksum64: `'$checksum64`', checksumType64: `'$checksumType64`' ";

try {
$file = "$($packageName).$fileType"
$fileFullPath = Join-Path $toolsDir $file
$destination = $toolsDir

Write-Host "Extracting $fileFullPath to $destination..."
if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile $packageName $fileFullPath $url $url64bit -checkSum $checkSum -checksumType $checksumType -checkSum64 $checkSum64 -checksumType64 $checksumType64

Write-ChocolateySuccess $packageName
} catch {
Write-ChocolateyFailure $packageName $($_.Exception.Message)
throw
}
