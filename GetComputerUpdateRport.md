# !Get-ComputerUpdateRport.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-ComputerUpdateRport.ps1
    
SYNOPSIS
    Get-ComputerUpdateRport
    
SYNTAX
    C:\mod-posh\powershell\production\Get-ComputerUpdateRport.ps1 [[-ADSPath] <String>] [<CommonPar
    ameters>]
    
    
DESCRIPTION
    This script uses two functions to get a list of computers from ActiveDirectory and then query
    each computer for a list of pending updates. It then returns selected fields from that function
    to create the report.
    

PARAMETERS
    -ADSPath <String>
        The LDAP URI where your computers are located.
        
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
    
    
        ScriptName: Get-ComputerUpdateRport
        Created By: Jeff Patton
        Date Coded: August 9, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-ComputerUpdateReport -ADSPath "LDAP://DC=company,DC=com" |Export-Csv -Path .\Report
    .CSV
    
    
    Description
    -----------
    This example shows sending the output to a .CSV file.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\Get-ComputerUpdateReport -ADSPath "LDAP://DC=company,DC=com"
    
    
    ComputerName    : scm
    KBArticleIDs    : 2512827
    RebootRequired  : False
    Title           : Security Update for Microsoft Silverlight (KB2512827)
    IsDownloaded    : True
    Description     : This security update to Silverlight includes fixes outlined in KBs 2514842 an
    d 25
                      12827.  This update is backward compatible with web applications built using 
    prev
                      ious versions of Silverlight.
    MaxDownloadSize : 6284664
    SupportURL      : http://go.microsoft.com/fwlink/?LinkID=105787
    
    Description
    -----------
    This example shows sample output
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-ComputerUpdateReport
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement
     https://code.google.com/p/mod-posh/wiki/ComputerManagemenet



```