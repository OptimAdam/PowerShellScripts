#----------------------------------------------------------
# LOAD ASSEMBLIES AND MODULES
#----------------------------------------------------------
Try
{
  Import-Module ActiveDirectory -ErrorAction Stop
}
Catch
{
  Write-Host "[ERROR]`t ActiveDirectory Module couldn't be loaded. Script will stop!"
  Exit 1
}

#----------------------------------------------------------
#STATIC VARIABLES
#----------------------------------------------------------
$users = Import-CSV -Delimiter "," .\USers.csv


#----------------------------------------------------------
#User creation
#----------------------------------------------------------
foreach ($User in $Users)            
{
   $Displayname = $User.Firstname + " " + $User.Lastname
   $UserFirstname = $User.Firstname
   $UserLastname = $User.Lastname
   $Email = $user.email
   $Company = $user.Company
   write-host $Company

}