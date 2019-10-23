#NOTE: Latest Release V2.
Please install V2 script

This script is made for automation certain task in VMware ESXI Host OR Vcenters.
The Script will perform the following functions.
1. Rename BULK VM
2. POWER OFF BULK VM
3. POWER ONN BULK VM
4. Rename back to the server names defined in the txt file.

Installation:
1. Open Powershell as ADMIN
2. Run " Set-ExecutionPolicy RemoteSigned" and type yes..
3. Run Install.ps1 file to install all the dependency.
VIDEO TUTORIAL: https://youtu.be/rxfUIcM4v8Q 


Running the Script:
1. Open Srvr.txt and write the VM names one by one line needed to be performed operation on
2. Open Creds.txt and give the Vcenter/ESXI Login Credentials.
Note: Credentials must given as first line username and the next line password.
3. Directly run the Script by right clicking on it.
4. Provide the Vcenter/ESXI host IP or URL without HTTP/HTTPS
5. On Successful connection options will be displayed to perform activity.
VIDEO TUTORIAL: https://youtu.be/aXhVuwLAAIA 

NOTE: For Delete Activity the script will rename the VMS with the hostname-Delete option.
and the Undo option will revert back the VMs to the original name.
---
Version Details.
---
:Version 3:
* Added new function to changer Vcenter without closing the script.
* Added Update Center, The script will check for any new updated by iself and intemate the user. 
* Bug Fixed.

:Version 2.1:
*Added Function to fetch Server Details for names already changed to "Hostname-Delete".

:Version 2:
* Added new function to refresh server list without exiting the script.
* Added new function to rename the server back from -Delete to original name.
* Code optimized.
* Lot of Bug Fixed**

:Version 1:
* Initial Development of the script.
* Very Basic functions.
* Not Stable
* Lot of errors.
