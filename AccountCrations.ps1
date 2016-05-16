function MessageFunction
{
param($Arg1, $Arg2)
$title = "Account Creation"

#$PeakEmployee = New-Object System.Management.Automation.Host.ChoiceDescription "&$Option1", `
#    "Users that need access to a Peak Service. (Home Depo/Contractors/Sales Reps/Installers) "

#$ExternalUsers = New-Object System.Management.Automation.Host.ChoiceDescription "&External Users", `
#    "Users that need access to a Peak Service. (Home Depo/Contractors/Sales Reps/Installers) "

#$Contact = New-Object System.Management.Automation.Host.ChoiceDescription "&Contact", `
#    "A contact that needs to be added to the address book"

#$options = [System.Management.Automation.Host.ChoiceDescription[]]($PeakEmployee, $ExternalUsers, $Contact)

$result = $host.ui.PromptForChoice($title, $Arg1, $Arg2, 0) 

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
$Question = "Department?"
}

function ExternalUsersFunction
{
"You selected External Users"
#Question and answers for the interface 
$Question = "Type of external user?"
$AnswerOptions = @("Inspectors","Installers","Navision","Peak Sales Rep","Sales Consultants","Vendors")
MessageFunction $Question $AnswerOptions
}

function ContactFunction
{
"You selected Contact."
}