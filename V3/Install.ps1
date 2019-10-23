Set-ExecutionPolicy RemoteSigned -Confirm:$false
Write-Host " `n Installing PowerCLI"
Install-Module -Name VMware.PowerCLI
Write-Host "`n seting powercli certificate check permission"
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Write-Host "`n Everything is done, please restart the PowerCLI and continue with the setps."