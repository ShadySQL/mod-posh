## Get-!DellDownloadURL ##
```
Get-DellDownloadURL [[-ServiceTag] <Object>] [[-DellCategory] <Object>]

```
## Get-!DellCurrentBIOSRev ##
```
Get-DellCurrentBIOSRev [[-ServiceTag] <Object>]

```
## Get-DellWarranty ##
```

NAME
    Get-DellWarranty
    
SYNOPSIS
    Quick script to invoke the Dell Jigsaw asset service.
    
SYNTAX
    Get-DellWarranty [-ServiceTag] <String> [<CommonParameters>]
    
    
DESCRIPTION
    

PARAMETERS
    -ServiceTag <String>
        One or more valid Dell Service Tag codes, separated by commas
        
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
    None. You cannot pipe to this script
    
    
OUTPUTS
    PS Objects containing warranty support entitlements for the provided service tag
    
    
    
RELATED LINKS



```
## Get-!DellBIOSReport ##
```
Get-DellBIOSReport [[-ComputerName] <Object>]

```