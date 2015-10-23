# !New-PrintJob.ps1 #
```

NAME
    C:\mod-posh\powershell\production\New-PrintJob.ps1
    
SYNOPSIS
    Log a print job to a file.
    
SYNTAX
    C:\mod-posh\powershell\production\New-PrintJob.ps1 [[-FileName] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script works in conjunction with an Event Trigger on the PrintService
    event on our print servers. This script queries the Microsoft-Windows-PrintService/Operational
    log for EventID 307, and returns the drive letter from the most recent event. 
    
    This should be the same event that triggered this script to
    run in the first place.
    
    It appends to a CSV log file if it exists, or creates a new file if it doesn't.
    

PARAMETERS
    -FileName <Object>
        The fully qualified path and filename for the report.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        ScriptName: New-PrintJob.ps1
        Created By: Jeff Patton
        Date Coded: August 17, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        Microsoft .NET Framework 3.5 or greater is required.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\New-PrintJob.ps1
    
    
    Description
    -----------
    This is the only syntax for this script.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/New-PrintJob



```