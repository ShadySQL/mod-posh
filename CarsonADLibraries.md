## Convert-!ObjectSID ##
```

NAME
    Convert-ObjectSID
    
SYNOPSIS
    Convert a string SID to an object
    
SYNTAX
    Convert-ObjectSID [[-ObjectSID] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns an object
    

PARAMETERS
    -ObjectSID <Object>
        The SID of the account
        
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
    
    
        This function was originall written by Carson Gee (http://carsongee.com)
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Convert-ObjectSID -ObjectSID S-1-5-21-57989841-1078081533-682003330-187082 |Format-Table 
    -AutoSize
    
    
    BinaryLength AccountDomainSid                       Value
    ------------ ----------------                       -----
              28 S-1-5-21-57989841-1078081533-682003330 S-1-5-21-57989841-1078081533-682003330-1870
    82
    
    Description
    -----------
    Showing the basic syntax and output of the function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/CarsonADLibraries#Convert-ObjectSID



```
## Convert-SIDToUser ##
```

NAME
    Convert-SIDToUser
    
SYNOPSIS
    Convert SID to a user object
    
SYNTAX
    Convert-SIDToUser [[-ObjectSID] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function takes a SID object and converts it to a user object
    

PARAMETERS
    -ObjectSID <Object>
        The SID object of the user account, this cannot be the string. Use
        Convert-ObjectSID to get the objectified SID from a string.
        
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
    
    
        This function was originall written by Carson Gee (http://carsongee.com)
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Convert-SIDToUser -ObjectSID (Convert-ObjectSID -ObjectSID S-1-5-21-57989841-1078081533-6
    82003330-18
    
    
    7082)
    
    Value
    -----
    HOME\s071b751
    
    Description
    -----------
    Shows the basic usage of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/CarsonADLibraries#Convert-SIDToUser



```