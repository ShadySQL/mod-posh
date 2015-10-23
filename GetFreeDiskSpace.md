# !Get-FreeDiskSpace.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-FreeDiskSpace.ps1
    
SYNOPSIS
    Return free space on disk
    
SYNTAX
    C:\mod-posh\powershell\production\Get-FreeDiskSpace.ps1 [[-FileName] <Object>] [<CommonParamete
    rs>]
    
    
DESCRIPTION
    This script works in conjunction with an Event Trigger on the System
    event on our file servers. This script queries the System log for 
    EventID 2013, and returns the drive letter from the most recent 
    event. 
    
    This should be the same event that triggered this script to
    run in the first place.
    
    It outputs an XML file to the StorageReports directory which exists 
    on both nodes of the file server cluster.
    

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
    
    
        ScriptName: Get-FreeDiskSpace.ps1
        Created By: Jeff Patton
        Date Coded: July 12, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FreeDiskSpace.ps1
    
    
    Description
    -----------
    This is the only syntax for this script.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-FreeDiskSpace



```