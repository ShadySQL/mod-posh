# !get-serials.ps1 #
```

NAME
    C:\mod-posh\powershell\production\get-serials.ps1
    
SYNOPSIS
    Get the BIOS serial numbers from computers in the domain.
    
SYNTAX
    C:\mod-posh\powershell\production\get-serials.ps1 [-ADSPath] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    Return a list of computers with their serial numbers. For Dell computers the Win32_BIOS.SerialN
    umber property
    is the service tag of the computer. This identifies the computer on the Dell support site, and 
    with it you can
    get the proper drivers/manuals and warranty information.
    

PARAMETERS
    -ADSPath <Object>
        The location within Active Directory to find computers.
        
        Required?                    true
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\get-serials.ps1 -ADSPath "LDAP://OU=workstations,DC=company,DC=com"
    
    
    ComputerName                                                ServiceTag
    ------------                                                ----------
    Desktop-pc01                                                a1b2c3d
    Desktop-pc02                                                b2c3d4e
    Desktop-pc03                                                The RPC server is unavailable. (Exc
    eption from H ...
    Desktop-pc04                                                f4g5h6i
    
    Description
    -----------
    This example shows the output of the command.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\get-serials.ps1 -ADSPath "LDAP://OU=workstations,DC=company,DC=com" `
    
    
    | Export-Csv .\sample.csv -NoTypeInformation
    
    Description
    -----------
    This example shows piping the output to a csv file.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/GetSerials



```