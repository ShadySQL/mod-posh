# !Get-OutageDuration.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-OutageDuration.ps1
    
SYNOPSIS
    Returns the length of time a server was offline.
    
SYNTAX
    C:\mod-posh\powershell\production\Get-OutageDuration.ps1 [[-FileName] <Object>] [<CommonParamet
    ers>]
    
    
DESCRIPTION
    This script works in conjunction with an Event Trigger on the System
    event. This script queries the System log for EventID 11, and returns
    when the computer went offline, when it came back online and how long
    it was unavailable.
           
    It outputs an XML file to the Reports directory which it creates if
    it doesn't exist already.
    

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
    
    
        ScriptName : Get-OutageDuration.ps1
        Created By : jeffpatton.admin
        Date Coded : 10/26/2011 17:12:21
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-OutageDuration.ps1
    
    
    Description
    -----------
    This is the only syntax for this script.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-OutageDuration.ps1



```