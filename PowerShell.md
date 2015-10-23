# Production Scripts #
|[Delete-LocalAccount.ps1](DeleteLocalAccount.md)|Delete's the specified account from computers found in Active Directory|
|:-----------------------------------------------|:----------------------------------------------------------------------|
|[Find-LocalAdmins.ps1](FindLocalAdmins.md)      |Returns the members of a specified group from computers found in Active Directory|
|[Update-AdminPassword.ps1](UpdateAdminPassword.md)|Updates the password of the specified user account from computers found in Active Directory|
|[Get-Serials.ps1](GetSerials.md)                |This script returns the serialnumber property from computers found in Active Directory|
|[Update-DeptGPOs.ps1](UpdateDeptGPOs.md)        |Update permissions on Departmental GPO's                               |
|[Get-FreeDiskSpace.ps1](GetFreeDiskSpace.md)    |Return free space on a disk                                            |
|[Get-DPMRecoveryPointReport.ps1](GetDPMRecoveryPointReport.md)|Return available recovery points                                       |


# PowerShell Functions #

Here is the home of my PowerShell functions. I'm taking advantage of PowerShell's ability to [dot-source](http://technet.microsoft.com/en-us/library/ee176949.aspx#ECAA) blocks of code. At the moment I am dividing them up between ActiveDirectory related functions and ComputerManagement functions.

## Active Directory Library [Get-Help](ActiveDirectoryManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/3cc670ca-9ddf-45b4-860c-9dec35f33d20) ##

The [ActiveDirectoryManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/ActiveDirectoryManagement.ps1) script holds all the functions related to working with ActiveDirectory.

## Computer Management Library [Get-Help](ComputerManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/ef8de213-45b6-4751-8c77-01d1b6623e16) ##

The [ComputerManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/ComputerManagement.ps1) script holds all the functions related to working with the local computer.

## File Management Library [Get-Help](FileManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/6c817b11-0c33-4444-93e5-0a8a51a06c64) ##

The [FileManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/FileManagement.ps1) script holds all the functions related to working with files.

## Muegge's LogParser Library [Get-Help](MueggeLogParser.md) ##

The [MueggeLogParser](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/MueggeLogParser.ps1) script holds all the functions related to working with Microsoft's LogParser. These functions were copied over from [Muegge's Blog](http://muegge.com/blog/?p=65)

## Network Management library [Get-Help](NetworkManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/f17c7600-5356-4e97-bc76-0551504d06a5) ##

The [NetworkManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/NetworkManagement.ps1) script holds all the functions related to working with networking properties.

## Performance Testing Library [Get-Help](PerformanceTesting.md) ##
The [PerformanceTesting](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/PerformanceTesting.ps1) script holds a collection of functions that can be used to test the performance of various scriptblocks, functions or cmdlets.

## SharePoint Management Library [Get-Help](SharePointManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/c59ba942-0b4a-423f-b9e1-4990264befac) ##

The [SharePointManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/SharePointManagement.ps1) script holds all the functions related to working with a Sharepoint Farm.

## Subversion Management Library [Get-Help](SubversionManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/059b4522-5445-47e5-9be4-c4d67571969a) ##

The [SubversionManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/SubversionManagement.ps1) script holds all the functions related to working with Subversion.

## Windows Firewall Management Library [Get-Help](WindowsFirewallManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/2834b674-7e16-479c-9de1-489903ee2652) ##

The [WindowsFirewallManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/WindowsFirewallManagement.ps1) script holds all the functions related to working with Windows Firewall.

## VMware Management Library [Get-Help](VMWareManagement.md) ##

The [VMwareManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/VMwareManagement.ps1) scripts holds all the functions related to working with and managing VMware datacenters.

## Print Server Management Library [Get-Help](PrintServerManagement.md) [Technet Gallery](http://gallery.technet.microsoft.com/scriptcenter/PrintServerManagementps1-7676ed28) ##

The [PrintServerManagement](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/PrintServerManagement.ps1) script holds all the functions related to working with print servers and queues in a Windows 2008 environment.

## PowerShell ISE Library [Get-Help](PSISELibrary.md) [Technet Gallery](http://gallery.technet.microsoft.com/PSISELibraryps1-ec442972) ##

The [PSISELibrary](https://code.google.com/p/mod-posh/source/browse/powershell/production/includes/PSISELibrary.ps1) script holds several functions for working with code inside the PowerShell ISE.