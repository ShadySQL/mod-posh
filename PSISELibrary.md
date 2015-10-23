## Replace-TabsWithSpace ##

```



NAME

    Replace-TabsWithSpace

    

SYNOPSIS

    Replaces a tab character with 4 spaces

    

SYNTAX

    Replace-TabsWithSpace [[-SelectedText] <Object>] [[-InstallMenu] <Object>] [<CommonParameters>]

    

    

DESCRIPTION

    This function examines the selected text in the PSIE SelectedText property and every tab

    character that is found is replaced with 4 spaces.

    



PARAMETERS

    -SelectedText <Object>

        The current contents of the SelectedText property

        

        Required?                    false

        Position?                    1

        Default value                

        Accept pipeline input?       false

        Accept wildcard characters?  

        

    -InstallMenu <Object>

        Specifies if you want to install this as a PSIE add-on menu

        

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

    

NOTES

    

    

        This was written specifically for me, I had some code originally created in Notepad++ that

        used actual tabs, later I changed that to spaces, but on occasion I come accross something

        that doesn't tab shift like it should. Since I've been doing some PowerShell ISE stuff lately

        I decided to write a little function that works as an Add-On menu.

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>Replace-TabsWithSpace -InstallMenu $true

    

    

    Description

    -----------

    Installs the function as a menu item.

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#Replace-TabsWithSpace



```

## New-CommentBlock ##

```

NAME

    New-CommentBlock

    

SYNOPSIS

    Inserts a full comment block

    

SYNTAX

    New-CommentBlock [[-InstallMenu] <Object>] [<CommonParameters>]

    

    

DESCRIPTION

    This function inserts a full comment block that is formatted the

    way I format all my comment blocks.

    



PARAMETERS

    -InstallMenu <Object>

        Specifies if you want to install this as a PSIE add-on menu

        

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

    

    

        FunctionName : New-CommentBlock

        Created by   : Jeff Patton

        Date Coded   : 09/13/2011 12:28:10

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>New-CommentBlock -InstallMenu $true

    

    

    Description

    -----------

    Installs the function as a menu item.

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#New-CommentBlock



```

## New-Script ##

```

NAME

    New-Script

    

SYNOPSIS

    Create a new blank script

    

SYNTAX

    New-Script [[-InstallMenu] <Object>] [[-ScriptName] <Object>] [<CommonParameters>]

    

    

DESCRIPTION

    This function creates a new blank script based on my original template.ps1

    



PARAMETERS

    -InstallMenu <Object>

        Specifies if you want to install this as a PSIE add-on menu

        

        Required?                    false

        Position?                    1

        Default value                

        Accept pipeline input?       false

        Accept wildcard characters?  

        

    -ScriptName <Object>

        This is the name of the new script.

        

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

    

NOTES

    

    

        FunctionName : New-Script

        Created by   : Jeff Patton

        Date Coded   : 09/13/2011 13:37:24

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>New-Script -ScriptName "New-ImprovedScript"

    

    

    Description

    -----------

    This example shows calling the function with the ScriptName parameter

    

    

    

    

    

    -------------------------- EXAMPLE 2 --------------------------

    

    C:\PS>New-Script -InstallMenu $true

    

    

    Description

    -----------

    Installs the function as a menu item.

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#New-Script



```

## New-Function ##

```

NAME

    New-Function

    

SYNOPSIS

    Create a new function

    

SYNTAX

    New-Function [[-SelectedText] <Object>] [[-InstallMenu] <Object>] [[-FunctionName] <Object>] [<CommonParameters>]

    

    

DESCRIPTION

    This function creates a new function that wraps the selected text inside

    the Process section of the body of the function.

    



PARAMETERS

    -SelectedText <Object>

        Currently selected code that will become a function

        

        Required?                    false

        Position?                    1

        Default value                

        Accept pipeline input?       false

        Accept wildcard characters?  

        

    -InstallMenu <Object>

        Specifies if you want to install this as a PSIE add-on menu

        

        Required?                    false

        Position?                    2

        Default value                

        Accept pipeline input?       false

        Accept wildcard characters?  

        

    -FunctionName <Object>

        This is the name of the new function.

        

        Required?                    false

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

    

    

        FunctionName : New-Function

        Created by   : Jeff Patton

        Date Coded   : 09/13/2011 13:37:24

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>New-Function -FunctionName "New-ImprovedFunction"

    

    

    Description

    -----------

    This example shows calling the function with the FunctionName parameter

    

    

    

    

    

    -------------------------- EXAMPLE 2 --------------------------

    

    C:\PS>New-Function -InstallMenu $true

    

    

    Description

    -----------

    Installs the function as a menu item.

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#New-Function



```

## Edit-File ##

```

NAME

    Edit-File

    

SYNOPSIS

    Open files in specified editor.

    

SYNTAX

    Edit-File [[-FileSpec] <Object>] [<CommonParameters>]

    

    

DESCRIPTION

    This function will open one or more files, in the specified editor.

    



PARAMETERS

    -FileSpec <Object>

        The filepath to open

        

        Required?                    false

        Position?                    1

        Default value                

        Accept pipeline input?       true (ByValue)

        Accept wildcard characters?  

        

    <CommonParameters>

        This cmdlet supports the common parameters: Verbose, Debug,

        ErrorAction, ErrorVariable, WarningAction, WarningVariable,

        OutBuffer and OutVariable. For more information, type,

        "get-help about_commonparameters".

    

INPUTS

    

OUTPUTS

    

NOTES

    

    

        Set $Global:POSHEditor in your $profile to the path of your favorite

        text editor or to C:\Windows\notepad.exe. If that variable is not set

        we'll try and open the file in the PowerShell ISE otherwise give

        the user a polite message telling them what to do.

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>Edit-File -FileSpec c:\powershell\*.ps1

    

    

    

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#Edit-File



```

## Save-All ##

```

NAME

    Save-All

    

SYNOPSIS

    Save all unsaved files in the editor

    

SYNTAX

    Save-All [<CommonParameters>]

    

    

DESCRIPTION

    This function will save all unsaved files in the editor

    



PARAMETERS

    <CommonParameters>

        This cmdlet supports the common parameters: Verbose, Debug,

        ErrorAction, ErrorVariable, WarningAction, WarningVariable,

        OutBuffer and OutVariable. For more information, type,

        "get-help about_commonparameters".

    

INPUTS

    

OUTPUTS

    

NOTES

    

    

        FunctionName : Save-All

        Created by   : jspatton

        Date Coded   : 02/13/2012 15:08:51

        

        Routinely I have a need to have open and be editing several files

        at once. Decided to write a function to save them all since there

        isn't one currently available.

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>Save-All

    

    

    Description

    -----------

    The only syntax for the command.

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#Save-All



```

## Set-SecureString ##

```

NAME

    Set-SecureString

    

SYNOPSIS

    Create a file with encrypted contents

    

SYNTAX

    Set-SecureString [[-FilePath] <String>] [<CommonParameters>]

    

    

DESCRIPTION

    This function creates an encrypted function to store data, typically

    you would use this store an encrypted password for an administrator

    account.

    



PARAMETERS

    -FilePath <String>

        The full path and filename to send the encrypted contents to

        

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

    

    

        FunctionName : Set-SecureString

        Created by   : jspatton

        Date Coded   : 03/01/2012 13:45:13

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>Set-SecureString -FilePath C:\Users\Auser\AdminCredentials.txt

    

    

    Description

    -----------

    This is the only syntax for this command.

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#Set-SecureString



```

## Get-SecureString ##

```

NAME

    Get-SecureString

    

SYNOPSIS

    Stores the contents of an encrypted file as a secure string

    

SYNTAX

    Get-SecureString [[-FilePath] <String>] [<CommonParameters>]

    

    

DESCRIPTION

    This function reads the contents of an encrypted file and returns it as

    a secure string object. This is ideally suited to reading in the contents

    of a file that contained an administrators password

    



PARAMETERS

    -FilePath <String>

        The full path and filename of the encrypted file

        

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

    

    

        FunctionName : Get-SecureString

        Created by   : jspatton

        Date Coded   : 03/01/2012 13:51:53

    

    -------------------------- EXAMPLE 1 --------------------------

    

    C:\PS>Get-SecureString -FilePath C:\Users\Auser\AdminCredentials.txt

    

    

    

    

    

    

    

    

    

RELATED LINKS

     https://code.google.com/p/mod-posh/wiki/PSISELibrary#Get-SecureString



```