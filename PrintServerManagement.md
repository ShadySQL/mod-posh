## Get-!Printers ##
```

NAME
    Get-Printers
    
SYNOPSIS
    Get a list of printers from the specified print server
    
SYNTAX
    Get-Printers [[-ComputerName] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the Name of each printer installed
    on the specified print server.
    

PARAMETERS
    -ComputerName <String>
        Name of the print server
        
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-Printers -ComputerName ps
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/PrintServerManagement#Get-Printers



```
## Get-PrintQueue ##
```

NAME
    Get-PrintQueue
    
SYNOPSIS
    Return the print queue for a given printer
    
SYNTAX
    Get-PrintQueue [[-ComputerName] <Object>] [[-Name] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the print queue for a specific printer 
    from the print server.
    

PARAMETERS
    -ComputerName <Object>
        Name of the print server
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Name <Object>
        Name of the print queue
        
        Required?                    false
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-PrintQueue -ComputerName ps -Name HPCLJ5500
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/PrintServertManagement#Get-PrintQueue



```
## Get-PrintJobs ##
```

NAME
    Get-PrintJobs
    
SYNOPSIS
    Return the list of jobs on the current printer
    
SYNTAX
    Get-PrintJobs [[-ComputerName] <Object>] [[-Name] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of pending jobs on the specified print server for a given queue
    

PARAMETERS
    -ComputerName <Object>
        Name of the print sever
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Name <Object>
        Name of the print queue
        
        Required?                    false
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-PrintJobs -ComputerName ps -Name HPLJ5000
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/PrintServerManagement#Get-PrintJobs



```