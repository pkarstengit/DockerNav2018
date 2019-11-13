$mylicense = "C:\temp\mylicence.flf"
$imageName = "microsoft/dynamics-nav:2018"
$sourceFolder = Join-Path $PSScriptRoot "Source"
$containerName = Split-Path $PSScriptRoot -Leaf
New-NavContainer -accept_eula `
                 -containerName $containerName `
                 -imageName $imageName `
                 -auth Windows `
                 -licensefile $mylicense `
                 -accept_outdated `
                 -updateHosts `
                 -includeCSide `
                 -additionalParameters @("--volume ${sourceFolder}:c:\source") 
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $sourceFolder -compile
