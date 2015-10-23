# !Get-RecoveryPointReport.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-RecoveryPointReport.ps1
    
SYNOPSIS
    Return a list of available Recovery Points from a DPM server
    
SYNTAX
    C:\mod-posh\powershell\production\Get-RecoveryPointReport.ps1 [-DPMServerName] <Object> [-Prote
    ctedComputer] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This script connects to a DPM server and queries a particular Production
    Server for it's DataSource. It then returns a list of all Recovery Points
    available in that DataSource.
    

PARAMETERS
    -DPMServerName <Object>
        The name of the server that has DPM installed on it
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ProtectedComputer <Object>
        The name of the protected computer.
        
        Required?                    true
        Position?                    2
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
    
    
        ScriptName : Get-RecoveryPointReport.ps1
        Created By : jspatton
        Date Coded : 10/11/2011 10:59:47
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
        
        You could adjust this script to suit your needs, I am really only interested
        in the date and size of a given Recovery Point.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-RecoveryPointReport.ps1 -DPMServerName 'dpm' -ProductionServerName 'fs'
    
    
    RecoveryPoint DateTime                           Size
    ------------- --------                           ----
    J:\           9/23/2011 12:00:53 PM  181.786190032959
    J:\           9/23/2011 6:00:58 PM   181.761642456055
    J:\           9/24/2011 8:01:04 AM   181.760643005371
    J:\           9/24/2011 12:00:29 PM  181.764755249023
    J:\           9/24/2011 6:01:29 PM   181.773876190186
    
    Description
    -----------
    This example shows the basic syntax of the command and expected output. The
    Size property has been converted into Gigabytes.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-RecoveryPointReport



```