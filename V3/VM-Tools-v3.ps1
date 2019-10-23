Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false |Out-Null
function updt(){
$vrsn=3
$url="https://raw.githubusercontent.com/binayadhar/UpdateSetings/master/VAT/VTUPDT.ini"
Invoke-WebRequest -Uri $url -OutFile temp.ini
$temp= Get-Content -Path .\temp.ini
$vrsn2 = $temp[0]
del .\temp.ini
if($vrsn -ilt $vrsn2){
$inp =  Read-Host "Volla.. Script Update is Available, Press Y to Update else N to skip"
if(($inp -eq "y") -or ($inp -eq "yes")){
write-host "the script is updating...."
$f1 = $temp[1]
$f2 = $temp[2]
Invoke-WebRequest -Uri $f1 -OutFile "Install.ps1"
Invoke-WebRequest -Uri $f2 -OutFile "VM-Tools-v$vrsn2.ps1"
Clear-Host
Write-Host " The Script has been sucessfully updates to $vrsn2, you can continue to use this terminal else open the new script located in the same folder as this script"
sleep(3)
}
else{
Clear-Host
}
}
else{Write-Host "No Updates are located"}
sleep(3)
Clear-Host
}
function rldall()
{
$Script:Srvr = Get-Content srvr.txt
$Script:credsall=Get-Content -Path .\creds.txt
$Script:Uname = $credsall[0]
$Script:Pass = $credsall[1]
}
function srvadr(){
$Script:addr= Read-Host -Prompt " Enter the Vcenter"
Write-Host "Please update the server list and close the notepad, then press any keys to continue"
notepad.exe Srvr.txt
pause
}
function con(){
write-host "`n Please wait, connecting to the Vcenter..."
Connect-VIServer -Server $addr -user $Uname -pass $Pass
}
function dcon(){
Disconnect-VIServer -Server $addr -Confirm:$false
}
function rens(){
foreach($Srvr in $Srvr){
$dltname=($srvr+"-Delete")
Set-VM -VM $srvr -Name $dltname -Confirm:$false
}
}
function renbck()
{
foreach($Srvr in $Srvr){
$dltname=($srvr+"-Delete")
Set-VM -VM $dltname -Name $srvr -Confirm:$false
}
}
function strt(){
foreach($Srvr in $Srvr){
Start-VM -VM $Srvr
}
}
function stp(){
foreach($Srvr in $Srvr){
Stop-VM -VM $Srvr -Confirm:$false
}
}
function sts(){
foreach($Srvr in $Srvr){
Get-VM -Name $Srvr
}
}
function revsts(){
foreach($Srvr in $Srvr){
$dltname=($srvr+"-Delete")
Get-VM -Name $dltname
}
}
function auth(){
   Clear-Host;
   "This script has been written and developed by Binaya Kumar Dhar
    Email: binaya.dhara@gmail.com
    social:https://www.facebook.com/VinayaRocks"
    pause
}
updt
rldall
srvadr
con
While ($true) {
Write-Host "`n Below are the choices:`n"
"1. PowerOFF VM's
2. PowerON VM's
3. Rename VM's
4. Undo Rename
5. Get the status with orignal name
6. Get the status with '-Delete' Extention
7. change Vcenter address
8. Reload Server List
9. Check for Script Updates
C. Credits
0. Exit the Script
"
$ch=Read-Host -Prompt "`n Please enter your choice"

If ($ch –eq "0")
   {
    ""
    Write-Host -ForegroundColor red "Sad to see you go!! Adios!!";
     sleep 2
     Break;

    }
If ($ch –eq "C")
    {

     auth;
     break;
    }
If (($ch -ne "1") -and ($ch -ne "2") -and ($ch -ne "3") -and ($ch -ne "4") -and ($ch -ne "5") -and ($ch -ne "6") -and ($ch -ne "7") -and ($ch -ne "8")-and ($ch -ne "9") -and ($ch -ne "0")) {
   ""
   Write-Host -ForegroundColor Red "Thats beyond the range, select again"
   sleep 2
    }
switch ($ch)
        {
          1 {
             stp;
             "Command completed!"
             sleep 2
            }
          2 {
              strt;
              "Command completed!"
              sleep 2
            }
          3 {
              rens;
              "Command completed!"
              sleep 2
             }
           4 {
               renbck;
               "Command completed!"
               sleep 2
             }
           5 {
               sts;
               "Command completed!"
               sleep 2
             }
           6 {
               revsts;
               "Command completed!"
               sleep 2
               
             }
           7 {
               dcon;
               srvadr;
               con;
               "Command completed!"
               sleep 2
              }
           8 {
               rldall;
               "Finished reading Fresh Values!"
               sleep 2
             }
            9{
               updt;
             }

           default { "Please select a correct option."}
    }
    }