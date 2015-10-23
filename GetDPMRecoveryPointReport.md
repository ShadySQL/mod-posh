# !Get-DPMRecoveryPointReport.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-DPMRecoveryPointReport.ps1
    
SYNOPSIS
    Return a list of available Recovery Points from a DPM server
    
SYNTAX
    C:\mod-posh\powershell\production\Get-DPMRecoveryPointReport.ps1 [-DPMServerName] <Object> [-Pr
    otectedComputer] <Object> [<CommonParameters>]
    
    
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
    
    
        ScriptName : Get-DPMRecoveryPointReport.ps1
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
    
    C:\PS>.\Get-DPMRecoveryPointReport.ps1 -DPMServerName 'dpm' -ProductionServerName 'fs'
    
    
    RecoveryPoint             Size Server                  DataSource                     DateTime
    -------------             ---- ------                  ----------                     --------
    P:\           3.40232849121094 fs.cluster.soecs.ku.edu P:\ on fs.cluster.soecs.ku.edu 10/6/2011
     ...
    P:\            3.4023323059082 fs.cluster.soecs.ku.edu P:\ on fs.cluster.soecs.ku.edu 10/7/2011
     ...
    P:\            3.4023323059082 fs.cluster.soecs.ku.edu P:\ on fs.cluster.soecs.ku.edu 10/8/2011
     ...
    P:\            3.4023323059082 fs.cluster.soecs.ku.edu P:\ on fs.cluster.soecs.ku.edu 10/9/2011
     ...
    
    Description
    -----------
    This example shows the basic syntax of the command and expected output. The
    Size property has been converted into Gigabytes.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-RecoveryPointReport



```