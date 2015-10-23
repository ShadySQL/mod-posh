## Get-HostName ##
```

NAME
    Get-HostName
    
SYNOPSIS
    Returns the hostname from the provided IP
    
SYNTAX
    Get-HostName [-ComputerName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Reutrns an object that contains the hostname from a DNS server query
    

PARAMETERS
    -ComputerName <String>
        The IP Address of a computer
        
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
    
    C:\PS>Get-HostName -ComputerName 127.0.0.1
    
    
    HostName                          Aliases                          AddressList
    --------                          -------                          -----------
    MyPC                              {}                               {fe80::d5af:b64e:c661:9202%1
    8...
    
    Description
    -----------
    The output of the function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/NetworkManagement#Get-HostName



```
## Get-HostIp ##
```

NAME
    Get-HostIp
    
SYNOPSIS
    Returns a list of IP's for the specified host.
    
SYNTAX
    Get-HostIp [-ComputerName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Returns a list of IP's for the specified host.
    

PARAMETERS
    -ComputerName <String>
        NetBIOS name of a computer
        
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
    
    C:\PS>Get-HostIp -Computer MyPC |Format-Table
    
    
    Address      AddressFamil      ScopeId IsIPv6Multic IsIPv6LinkL IsIPv6SiteL IPAddressTo Sortabl
    eAdd
                            y                       ast        ocal        ocal String             
    ress
    -------      ------------      ------- ------------ ----------- ----------- ----------- -------
    ----
                    ...NetworkV6           18        False        True       False fe80::d5... ...7
    261E+38
                    ...NetworkV6           19        False        True       False fe80::95... ...7
    261E+38
                    ...NetworkV6           11        False        True       False fe80::48... ...7
    261E+38
                    ...NetworkV6           12        False        True       False fe80::20... ...7
    261E+38
    16820416     InterNetwork                     False       False       False 192.168.0.1  323223
    5521
    31631552     InterNetwork                     False       False       False 192.168....  323229
    3377
    553717932    InterNetwork                     False       False       False 172.16.1.33  288673
    0017
                    ...NetworkV6            0        False       False       False 2001:0:4... ...1
    596E+37
    
    Description
    -----------
    This example shows the output of the function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/NetworkManagement#Get-HostIp



```
## Get-NetstatReport ##
```

NAME
    Get-NetstatReport
    
SYNOPSIS
    Returns the output of netstat -anop TCP|UDP
    
SYNTAX
    Get-NetstatReport [<CommonParameters>]
    
    
DESCRIPTION
    Returns the output of netstat -anop TCP|UDP in a format that can be processed by the built-in
    PowerShell commands.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Functionized the get-netstat code found on http://poshcode.org/get/592. The version on posh
        code 
        objectified each line and returned that line. This version creates an object above the for 
        and adds the 
        noteproperties inside the loop.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-NetstatReport |Format-Table
    
    
    PID       ProcessNa LocalAddr State     User      ProcessPa RemoteAdd LocalPort Protocol  Remot
    ePor
                me        ess                           th        ress                          t
    ---       --------- --------- -----     ----      --------- --------- --------- --------  -----
    ----
    792       svchost   0.0.0.0   LISTENING                     0.0.0.0   135       TCP       0
    4         System    0.0.0.0   LISTENING                     0.0.0.0   445       TCP       0
    2324      vmware... 0.0.0.0   LISTENING                     0.0.0.0   912       TCP       0
    2992      svchost   0.0.0.0   LISTENING                     0.0.0.0   990       TCP       0
    468       wininit   0.0.0.0   LISTENING                     0.0.0.0   1025      TCP       0
    976       svchost   0.0.0.0   LISTENING                     0.0.0.0   1026      TCP       0
    
    Description
    -----------
    Sample output of the function after being piped into Format-Table
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/NetworkManagement#Get-NetstatReport



```