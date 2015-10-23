# !Update-VmFromTemplate.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Update-VmFromTemplate.ps1
    
SYNOPSIS
    Create a new VM from an imported template
    
SYNTAX
    C:\mod-posh\powershell\production\Update-VmFromTemplate.ps1 [-TargetVM] <String> [-NewVMName] <
    String> [<CommonParameters>]
    
    
DESCRIPTION
    This script will modify a VM on Hyper-V R2 that has been imported from an exported VM.
    The current release of the HyperV module does not support the proper Import method, so 
    I don't implement that bit in this script.
    

PARAMETERS
    -TargetVM <String>
        This is the name of the imported VM Template
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -NewVMName <String>
        This is the name you wish to give your new VM
        
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
    
    
        ScriptName: Update-VmFromTemplate.ps1
        Created By: Jeff Patton
        Date Coded: August 3, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        You will need the HyperV Module from Codeplex
            http://pshyperv.codeplex.com/
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Update-VmFromTemplate.ps1 -TargetVM "2008 Core Server" -NewVMName "IIS Web Server"
    
    
    Description
    -----------
    This is the only syntax for this script.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Update-VmFromTemplate
     http://technet.microsoft.com/en-us/magazine/ff458346.aspx
     http://pshyperv.codeplex.com/



```