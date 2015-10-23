# !Update-DeptGPOs.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Update-DeptGPOs.ps1
    
SYNOPSIS
    Update permissions on Departmental GPO's
    
SYNTAX
    C:\mod-posh\powershell\production\Update-DeptGPOs.ps1 [[-DeptCode] <Object>] [[-TargetName] <Ob
    ject>] [[-TargetType] <Object>] [[-PermissionLevel] <Object>] [[-BackupLocation] <Object>] [[-T
    est] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script will backup all existing GPO's in the domain prior to making any changes. After the
     backup
    has been made Departmental GPOs will be updated based on their Dept Code.
    

PARAMETERS
    -DeptCode <Object>
        A code that uniquely identifies the GPOs for your department, this is used as a filter agai
        nst the 
        name of the GPO in question.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TargetName <Object>
        The name of the user/group to assign permissions to
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TargetType <Object>
        The default for this parameter is User, but if TargetName is a group, then 
        this should be set to Group.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -PermissionLevel <Object>
        Valid permission levels are
            GpoRead
            GpoApply
            GpoEdit
            GpoEditDeleteModifySecurity
            None
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -BackupLocation <Object>
        A valid location either local or UNC to store the GPO backups.
        
        Required?                    false
        Position?                    5
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Test <Object>
        Set to $False in order to update security and perform backup.
        
        Required?                    false
        Position?                    6
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
    
    
        ScriptName: Update-DeptGPOs
        Created By: Jeff Patton
        Date Coded: June 7, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        This script depends on PowerShell GroupPolicy modules to functino properly, the linked in 
        cmdlets are used in this script.
        
        If a backup cannot be made the script terminates.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Update-DeptGPOs.ps1 -DeptCode "Admin" -TargetName "MyUser" -BackupLocation "c:\temp"
    
    
    Description
    -----------
    This example shows basic usage, and assumes the default permissionlevel of None.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\Update-DeptGPOs.ps1 -DeptCode "Admin" -TargetName "MyUser" -PermissionLevel "GpoEditDel
    eteModifySecurity" -BackupLocation "c:\temp"
    
    
    Description
    -----------
    This example assigns GpoEditDeleteModifySecurity to the MyUser account for all GPOs tagged as A
    dmin
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Update-DeptGPOs
     http://technet.microsoft.com/en-us/library/ee461059.aspx
     http://technet.microsoft.com/en-us/library/ee461038.aspx
     http://technet.microsoft.com/en-us/library/ee461052.aspx



```