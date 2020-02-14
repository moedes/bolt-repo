#Example CIS Hardening file

#Defines Baseline configuration for a system
Configuration Baseline
{
    Install-Module -Name SecurityPolicyDsc
    Import-Module -Name SecurityPolicyDsc
    Import-DscResource -Module SecurityPolicyDsc

    try {
        AccountPolicy PasswordPolicy
        {
            Name                     = 'Enforcement'
            Enforce_password_history = 5
        }
    }
    catch {write-host "I caught an error in Accountpolicy"}
    
    Registry InteractiveLogon
    {
        Ensure      = "Present" 
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName   = "TestKey"
        ValueData   = "0"
    }

    WindowsFeature IISWebsite
    {
        Name = "Web-Server"
        Ensure = "Present"
    }

    WindowsFeature IISMGMT
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
}

#Compiles the Baseline Configuration to produce the MOF (Managed Object Format) file
Baseline

#Run the configuration on the machine
Start-DSCConfiguration -Path Baseline -Verbose -Wait