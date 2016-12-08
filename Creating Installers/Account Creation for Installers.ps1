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
$users = Import-CSV -Delimiter "," .\Users.csv
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
   $Phone = $user.phone
   $Company = $user.Company
   $Addresses = $user.Address
   $City = $user.city
   $Post_Code = $user.post_code
#create random number for password
   $random = get-random -Maximum 9999
   $Password = $userfirstname.Substring(0,2)+ $UserLastname.Substring(0,2)+ "_" + $random 
   $Securepassword = convertto-securestring $Password -asplaintext -force
   Write-Host $UserPrincipalName ", " $Password

#create user set SMTP proxy address, ou path
    new-aduser $Displayname -SamAccountName $Username -UserPrincipalName $UserPrincipalName -EmailAddress $UserPrincipalName -Company $Company -AccountPassword $Securepassword -PasswordNeverExpires $true -GivenName $UserFirstname -DisplayName $Displayname -Surname $UserLastname -Office EXCLUDE -OtherAttributes @{'proxyAddresses'="SMTP:$Email"} -Path "OU=Inspectors,OU=Contractors,OU=External Users,OU=Peak,DC=peak,DC=internal"

#add to groups
$Groups = "domain guests","Installations - Installers"
ForEach ($Group in $Groups)
    {Add-ADGroupMember $Group  $Username}

#set primary group
$group = get-adgroup "domain guests" -properties @("primaryGroupToken")
get-aduser $Username | set-aduser -replace @{primaryGroupID=$group.primaryGroupToken}

#remove group
remove-adgroupmember -Identity "Domain Users" -Member $Username -Confirm:$false

#enable account.
Enable-ADAccount -Identity $Username 

}