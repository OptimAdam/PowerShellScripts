function MessageFunction($Question, $smarray)
{
write-host $smarray
$title = "Account Creation"
$PeakEmployee = New-Object System.Management.Automation.Host.ChoiceDescription "&$Option1", `
    "$OptionStatment1"

$ExternalUsers = New-Object System.Management.Automation.Host.ChoiceDescription "&External Users", `
    "Users that need access to a Peak Service. (Home Depo/Contractors/Sales Reps/Installers) "

$Contact = New-Object System.Management.Automation.Host.ChoiceDescription "&Contact", `
    "A contact that needs to be added to the address book"

$options = [System.Management.Automation.Host.ChoiceDescription[]]($PeakEmployee, $ExternalUsers, $Contact)

$result = $host.ui.PromptForChoice($title, $Question, $smarray, 0) 

switch ($result)
    {
        0 {EmployeeFunction}
        1 {ExternalUsersFunction}
        2 {ContactFunction}
    } 
}

$title = "Account Creation"
$message = "What type of account to do want to create?"

$PeakEmployee = New-Object System.Management.Automation.Host.ChoiceDescription "&Peak Employee", `
    "A person who is employed directly bay Peak."

$ExternalUsers = New-Object System.Management.Automation.Host.ChoiceDescription "&External Users", `
    "Users that need access to a Peak Service. (Home Depo/Contractors/Sales Reps/Installers) "

$Contact = New-Object System.Management.Automation.Host.ChoiceDescription "&Contact", `
    "A contact that needs to be added to the address book"

$options = [System.Management.Automation.Host.ChoiceDescription[]]($PeakEmployee, $ExternalUsers, $Contact)

$result = $host.ui.PromptForChoice($title, $message, $options, 0) 

switch ($result)
    {
        0 {EmployeeFunction}
        1 {ExternalUsersFunction}
        2 {ContactFunction}
    } 

function EmployeeFunction
{
"You selected Employee"
}

function ExternalUsersFunction
{
"You selected External Users"
$message = 1,2
write-host $message
 MessageFunction "Type of external user?" "$message"
}

function ContactFunction
{
"You selected Contact."
}