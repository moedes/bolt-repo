#Example CIS Hardening file

Configuration Baseline
{
    Registry InteractiveLogon
    {
        Ensure      = "Present"  # You can also set Ensure to "Absent"
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName   = "TestKey"
        ValueData   = "0"
    }
}