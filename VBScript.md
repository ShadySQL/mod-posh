# Visual Basic Scripts #
Here is the home of just about all the vbscripts I've created over the past several years. I'm currently in the process of migrating away from vbs and over to PowerShell. I have re-organized my repo to reflect my most recent trend in creating vb scripts. I had a separate ActiveDirectoryScript project, but as I move away from vbs it seemed pointless to have it separate, so I moved that code into this repo.

# Active Directory Scripts #
I do a significant amount of coding against AD, and a large portion of them wind up looking very similar in build. A few years ago I took to stubbing out all my functions and procedures into separate files, this made it easy for me to quickly copy/paste together a script to do whatever. There are more than likely all sorts of frameworks for doing this, but this one is mine. I haven't really worked out the details just yet, but the main [[source:template.vbs]]  script contains the basic wrapper.

# Components #
There are currently three procedures that make up the basic template script.
  * LogData, which writes information to the Application log.
  * ScriptDetails, which returns details about the script running.
  * QueryAD, which searches Active Directory.
## QueryAD Subroutine ##
The QueryAD  procedure is a very simple script that loops through a recordset of objects returned from the Active Directory. The procedure uses the strQuery variable to represent your LDAP query.

This procedure accepts one parameter:
strQuery

The strQuery parameter represents the Active Directory query you wish to perform and should look similar to the following:

> strQuery = "SELECT " & strPropertyList & " FROM '" & strLDAPURL & "' WHERE objectClass = '" & strObjectClass & "'"

I have shown the assignment using variables to represent the significant portions of the query, you could certainly manually build the query, but this format allows for much more flexibility.
## LogData Subroutine ##
I created a simple logging routine that writes to the Application log of the computer where the script runs, it accepts two parameters:

  * intCode
  * strMessage

I use this routine to log when the script starts and stops as well as a basic error handling routine. When I'm using it to handle errors, the strMessage variable is usually a combination of Err.Number, Err.Description as well as text that might say what I wanted to have happen when the error occurred.

### intCode ###
This is an integer between 0 and 4 that determines the icon that will appear in the Application log on a Windows based computer.

  * 0 = Success
  * 1 = Error
  * 2 = Warning
  * 3 = Information

### strMessage ###
This is a string variable that holds the body of the message, usually in my scripts this is built in another function.
## ScriptDetails Function ##
I wrote the ScriptDetails function to provide better information in the Application Log regarding what script executed, where was it located, and who executed it. This information is then passed back to the LogData procedure to be input into the Application Log.

The functions accepts one parameter:

  * strComputer

### strComputer ###
This function takes advantage of the Wscript object to return the name of the script in memory, and its fully qualified path. Then it uses WMI to connect to the computer, it uses the value in strComputer to return the username of the user currently running this script.