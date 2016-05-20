#Create password and saves it as a secure string
$password = convertto-securestring "AjHi_2345" -asplaintext -force

#create user set SMTP proxy address, ou path
new-aduser PStest -UserPrincipalName pstest@PeakInstallations.com -Company Company1 -AccountPassword $password -PasswordNeverExpires $true -GivenName Adam -DisplayName "Adam Hird" -Surname Hird -Office EXCLUDE -OtherAttributes @{'proxyAddresses'="SMTP:test@mars.com"} -Path "OU=Inspectors,OU=Contractors,OU=External Users,OU=Peak,DC=peak,DC=internal"

#add to groups
$Groups = "domain guests","Insurance - Photo Upload"
ForEach ($Group in $Groups)
    {Add-ADGroupMember $Group  PStest}

#set primary group
$group = get-adgroup "domain guests" -properties @("primaryGroupToken")
get-aduser "PStest" | set-aduser -replace @{primaryGroupID=$group.primaryGroupToken}

#remove group
remove-adgroupmember -Identity "Domain Users" -Member "PStest" -Confirm:$false

#enable account.
Enable-ADAccount -Identity PStest