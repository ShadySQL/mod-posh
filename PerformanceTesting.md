## Get-AverageRunTime ##
```

NAME
    Get-AverageRunTime
    
SYNOPSIS
    Return the average time in milliseconds it takes a command to run.
    
SYNTAX
    Get-AverageRunTime [[-Counter] <Object>] [[-ScriptBlock] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the average time in milliseconds for a command to run over several iterat
    ions. 
    Simply pass in the number of iterations, and the script block you wish to test.
    

PARAMETERS
    -Counter <Object>
        A number representing how many times to time the block.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ScriptBlock <Object>
        A valid cmdlet or block of code for example:
            
        Start-Sleep 5
        Get-Process
        Get-WmiObject win32_bios -ComputerName server01
        
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
    
    C:\PS>Get-AverageRunTime
    
    
    Average time of 5 runs of 5 seconds is 5005.9882 milliseconds.
        
    Description
    -----------
    An example showing the function running with no parameters.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-AverageRunTime -Counter 3
    
    
    Average time of 3 runs of 5 seconds is 5006.80143333333 milliseconds.
        
    Description
    -----------
    An example showing the function with a different counter value.
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>Get-AverageRunTime -Counter 5 -ScriptBlock "Start-Sleep 3"
    
    
    Average time of 5 runs of (Start-Sleep 3) is 3008.26246 milliseconds
        
    Description
    -----------
    This example shows the use of both the ScriptBlock and Counter parameters.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/PerformanceTesting#Get-AverageRunTime



```