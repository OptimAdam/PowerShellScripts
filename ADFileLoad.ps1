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
$Suffix = "@PeakInstallations.com"
$OU = "OU=Inspectors,OU=Contractors,OU=External Users,OU=Peak,DC=peak,DC=internal"

#----------------------------------------------------------
#User creation
#----------------------------------------------------------
foreach ($User in $Users)            
{
   $Displayname = $User.Firstname + " " + $User.Lastname
   $Username = $User.Firstname + "." + $User.Lastname
   $UserPrincipalName = $Username + "@PeakInstallations.com"
   $UserFirstname = $User.Firstname
   $UserLastname = $User.Lastname
   $Email = $user.email
   $Company = $user.Company
#create random number for password
   $random = get-random -Maximum 9999
   $Password = $userfirstname.Substring(0,2)+ $UserLastname.Substring(0,2)+ "_" + $random 
   $Securepassword = convertto-securestring $Password -asplaintext -force
   Write-Host $UserPrincipalName " - " $Password
   

}