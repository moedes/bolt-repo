#Example CIS Hardening file

#Defines Baseline configuration for a system
Configuration Baseline
{
    Registry InteractiveLogon
    {
        Ensure      = "Present" 
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName   = "TestKey"
        ValueData   = "0"
    }
}

#Compiles the Baseline Configuration to produce the MOF (Managed Object Format) file
Baseline

#Run the configuration on the machine
Start-DSCConfiguration -Path Baseline -Verbose -Wait