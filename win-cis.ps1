#Example CIS Hardening file

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
Baseline
Start-DSCConfiguration -Path Baseline -Verbose -Wait