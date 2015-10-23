# !Update-LabComputers.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Update-LabComputers.ps1
    
SYNOPSIS
    Update lab computers
    
SYNTAX
    C:\mod-posh\powershell\production\Update-LabComputers.ps1 [-ADSPath] <String> [-GroupName] <Str
    ing> [-DomainName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This script updates the Administrators group on the lab computers. This could be done
    with a GPO, but sometimes our requirements change and this is easier and more immediate.
    

PARAMETERS
    -ADSPath <String>
        A valid LDAP URI to the OU containing the computers to update.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -GroupName <String>
        The name of the group to add to Administrators.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -DomainName <String>
        The NetBIOS domain name of your domain.
        
        Required?                    true
        Position?                    3
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
    
    
        ScriptName: Update-LabComputers
        Created By: Jeff Patton
        Date Coded: May 24, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Update-LabComputers -ADSPath "LDAP://OU=Workstations,DC=company,DC=com" -GroupName "Stude
    ntAdmins" -DomainName "COMPANY"
    
    
    Description
    -----------
    The basic syntax of the script.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Update-LabComputers -ADSPath "LDAP://OU=Workstations,DC=company,DC=com" -GroupName "Stude
    ntAdmins" -DomainName "COMPANY" | Export-Csv ./Report.csv -NoTypeInformation
    
    
    Description
    -----------
    Shows piping the output of the script to a csv file.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Update-LabComputers



```