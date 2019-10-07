Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false |Out-Null
$credsall=Get-Content -Path .\creds.txt
$Uname = $credsall[0]
$Pass = $credsall[1]
$addr= Read-Host -Prompt " Enter the Vcenter"
write-host "`n Please wait, connecting to the Vcenter..."
#Connect-VIServer -Server $addr -user $Uname -pass $Pass
Write-Host " `n Below are the choices:
1. PowerOFF VM's
2. PowerON VM's
3. Rename VM's
4. Get the status of the VM"

$ch=Read-Host -Prompt "`n Please enter your choice"
$Srvr = Get-Content srvr.txt
#Started Switch Case
switch($ch){
3{foreach($Srvr in $Srvr){
$dltname=($srvr+"-Delete")
Set-VM -VM $srvr -Name $dltname -Confirm:$false
}
}
2{
foreach($Srvr in $Srvr){
Start-VM -VM $Srvr
}
}
1{
foreach($Srvr in $Srvr){
Stop-VM -VM $Srvr -Confirm:$false
}
}
4{
foreach($Srvr in $Srvr){
Get-VM -Name $Srvr
}
}
default{

Write-Host "Opps!! Invalid Option Selected!"
}
}
Write-Host "`n The Script has been completed"
Pause
