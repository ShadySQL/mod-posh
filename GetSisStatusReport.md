# !Get-SisStatusReport.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-SisStatusReport.ps1
    
SYNOPSIS
    Get SIS Status
    
SYNTAX
    C:\mod-posh\powershell\production\Get-SisStatusReport.ps1 [[-Disks] <Object>] [<CommonParameter
    s>]
    
    
DESCRIPTION
    This script uses Get-SisReport to get the status of SiS'd disks on a storage server.
    

PARAMETERS
    -Disks <Object>
        Requires a disk object, if left blank gets all disks where the Provider
        is filesystem.
        
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
    
    
        ScriptName: Get-SisStatusReport.ps1
        Created By: Jeff Patton
        Date Coded: July 8, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        This script will only work on a server with the Enterprise SKU
        and where SIS is enabled on a given volume.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-SisStatusReport.ps1
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-SisStatusReport



```