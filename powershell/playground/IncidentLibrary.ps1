function Get-NetView 
{
	switch -regex (NET.EXE VIEW) 
    { 
        "^\\\\(?<Name>\S+)\s+" 
        {
            New-Object -TypeName PSObject -Property @{
                ServerName = $matches.Name
                }
            }
        }
	}
Function Get-DNSClientCache
{
    $output = (IPConfig /DisplayDNS) |
        Select-String -Pattern "Record Name" -Context 0,5
    $output | Foreach {
        New-Object -TypeName PSObject -Property @{
            Name=($_.Line -Split ":")[1]
            Type=($_.Context.PostContext[0] -Split ":")[1]
            TTL=($_.Context.PostContext[1] -Split ":")[1]
            Length=($_.Context.PostContext[2] -Split ":")[1]
            Section=($_.Context.PostContext[3] -Split ":")[1]
            HostRecord=($_.Context.PostContext[4] -Split ":")[1]
            }
    }
}

Function Get-ArpCache
{
    $output = netsh interface ipv4 show ipnettomedia
    $output = $output[4..($output.Length)]
    $output |foreach {
        $parts = $_ -split "\s+", 4
        New-Object -TypeName PSObject -Property @{
            MacAddress = $parts[0]
            IpAddress = $parts[1]
            Type = $parts[2]
            Interface = $parts[3]
            }
        }
}
Function Get-NbtStat
{
    $Nbtstat = (&nbtstat -n) |Select-String "<" |foreach {$_.Line.Trim()}
    $Nbtstat | foreach { $temp=$_ -split "\s+"
        New-Object -TypeName PSObject -Property @{
        Name=$temp[0]
        NbtCode=$temp[1]
        Type=$temp[2]
        Status=$temp[3]
        }
    }

}

Function Get-IPv6Route
{
    $output = netsh interface ipv6 show route
    $output = $output[3..($output.length-2)]
    $output | foreach {
        $parts = $_ -split "\s+", 6
        New-Object -Type PSObject -Property @{
            Publish = ($parts[0] -eq "Yes")
            Type = $parts[1]
            Metric = [int]($parts[2])
            Prefix = $parts[3]
            Idx = $parts[4]
            InterfaceName = $parts[5]
        }
    }
} 

Function Get-IPv4Route
{
    $output = netsh interface ipv4 show route
    $output = $output[3..($output.length-2)]
    $output | foreach {
        $parts = $_ -split "\s+", 6
        New-Object -Type PSObject -Property @{
            Publish = ($parts[0] -eq "Yes")
            Type = $parts[1]
            Metric = [int]($parts[2])
            Prefix = $parts[3]
            Idx = $parts[4]
            InterfaceName = $parts[5]
        }
    }
} 

Function Get-Netstat
{
$netstat = netstat -a -n -o | where-object { $_ -match "(UDP|TCP)" }
[regex]$regexTCP = '(?<Protocol>\S+)\s+((?<LAddress>(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?))|(?<LAddress>\[?[0-9a-fA-f]{0,4}(\:([0-9a-fA-f]{0,4})){1,7}\%?\d?\]))\:(?<Lport>\d+)\s+((?<Raddress>(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?))|(?<RAddress>\[?[0-9a-fA-f]{0,4}(\:([0-9a-fA-f]{0,4})){1,7}\%?\d?\]))\:(?<RPort>\d+)\s+(?<State>\w+)\s+(?<PID>\d+$)'

[regex]$regexUDP = '(?<Protocol>\S+)\s+((?<LAddress>(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?)\.(2[0-4]\d|25[0-5]|[01]?\d\d?))|(?<LAddress>\[?[0-9a-fA-f]{0,4}(\:([0-9a-fA-f]{0,4})){1,7}\%?\d?\]))\:(?<Lport>\d+)\s+(?<RAddress>\*)\:(?<RPort>\*)\s+(?<PID>\d+)'
$Report = @()

foreach ($Line in $Netstat)
{
    switch -regex ($Line.Trim())
    {
        $RegexTCP
        {
            $MyProtocol = $Matches.Protocol
            $MyLocalAddress = $Matches.LAddress
            $MyLocalPort = $Matches.LPort
            $MyRemoteAddress = $Matches.Raddress
            $MyRemotePort = $Matches.RPort
            $MyState = $Matches.State
            $MyPID = $Matches.PID
            $MyProcessName = (Get-Process -Id $Matches.PID -ErrorAction SilentlyContinue).ProcessName
            $MyProcessPath = (Get-Process -Id $Matches.PID -ErrorAction SilentlyContinue).Path
            $MyUser = (Get-WmiObject -Class Win32_Process -Filter ("ProcessId = "+$Matches.PID)).GetOwner().User
        }
        $RegexUDP
        {
            $MyProtocol = $Matches.Protocol
            $MyLocalAddress = $Matches.LAddress
            $MyLocalPort = $Matches.LPort
            $MyRemoteAddress = $Matches.Raddress
            $MyRemotePort = $Matches.RPort
            $MyState = $Matches.State
            $MyPID = $Matches.PID
            $MyProcessName = (Get-Process -Id $Matches.PID -ErrorAction SilentlyContinue).ProcessName
            $MyProcessPath = (Get-Process -Id $Matches.PID -ErrorAction SilentlyContinue).Path
            $MyUser = (Get-WmiObject -Class Win32_Process -Filter ("ProcessId = "+$Matches.PID)).GetOwner().User
        }
    }
    New-Object -TypeName PSobject -Property @{
        Protocol = $MyProtocol
        LocalAddress = $MyLocalAddress
        LocalPort = $MyLocalPort
        RemoteAddress = $MyRemoteAddress
        RemotePort = $MyRemotePort
        State = $MyState
        PID = $MyPID
        ProcessName = $MyProcessName
        ProcessPath = $MyProcessPath
        User = $MyUser
        }
}
}
Function Get-OpenSessions
{
    <#
        .SYNOPSIS
            Return a list of open sessions
        .DESCRIPTION
            This function returns a list of open session on a given server. The output is 
            similar to that of the Manage Open Sessions dialog in the Share and Storage
            Management console.
        .PARAMETER ComputerName
            This is the FQDN or NetBIOS name of the computer
        .EXAMPLE
            Get-OpenSessions -ComputerName fs

            User          Computer         ConnectTime     IdleTime
            ----          --------         -----------     --------
            user1         10.10.1.62              1615            1
            user2         10.10.1.156             7529           17

            Description
            -----------
            This example shows the basic usage of the command.
        .NOTES
            FunctionName : Get-OpenSessions
            Created by   : Jeff Patton
            Date Coded   : 09/26/2011 11:35:40
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/ComputerManagement#Get-OpenSessions
    #>
    Param
        (
            $ComputerName = (hostname)
        )
    Begin
    {
        $ServerSessions = @()
        $Server = [adsi]"WinNT://$($ComputerName)/LanmanServer"
        $Sessions = $Server.PSBase.Invoke("Sessions")
        }
    Process
    {
        foreach ($Session in $Sessions)
        {
            Try
            {
                $UserSession = New-Object -TypeName PSobject -Property @{
                    User = $Session.GetType().InvokeMember("User","GetProperty",$null,$Session,$null)
                    Computer = $Session.GetType().InvokeMember("Computer","GetProperty",$null,$Session,$null)
                    ConnectTime = $Session.GetType().InvokeMember("ConnectTime","GetProperty",$null,$Session,$null)
                    IdelTime = $Session.GetType().InvokeMember("IdleTime","GetProperty",$null,$Session,$null)
                    }
                }
            Catch
            {
                }
            $ServerSessions += $UserSession
            }
        }
    End
    {
        Return $ServerSessions
        }
    }
Function Get-OpenFiles
{
    <#
        .SYNOPSIS
            Get a list of files open on the server
        .DESCRIPTION
            This function returns a list of files open on a given server. The output is
            similar to that of the Manage Open Files from the Share and Storage Management
            console.
        .PARAMETER ComputerName
            The NetBIOS or FQDN of the computer
        .EXAMPLE
            Get-OpenFiles -ComputerName fs

            User          Path                              LockCount
            ----          ----                              ---------
            User1         F:\Users\User1\Documents\Data\...         0
            User2         P:\Public                                 0

            Description
            -----------
            This example shows the basic usage of this command.
        .NOTES
            FunctionName : Get-OpenFiles
            Created by   : Jeff Patton
            Date Coded   : 09/26/2011 13:01:38
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/ComputerManagement#Get-OpenFiles
    #>
    Param
        (
            $ComputerName = (hostname)
        )
    Begin
    {
        $OpenFiles = @()
        $Server = [adsi]"WinNT://$($ComputerName)/LanmanServer"
        $Resources = $Server.PSBase.Invoke("Resources")
        }
    Process
    {
        foreach ($Resource in $Resources)
        {
            Try
            {
                $UserResource = New-Object -TypeName PSobject -Property @{
                    User = $Resource.GetType().InvokeMember("User","GetProperty",$null,$Resource,$null)
                    Path = $Resource.GetType().InvokeMember("Path","GetProperty",$null,$Resource,$null)
                    LockCount = $Resource.GetType().InvokeMember("LockCount","GetProperty",$null,$Resource,$null)
                    }
                }
            Catch
            {
                }
            }
        $OpenFiles += $UserResource
        }
    End
    {
        Return $OpenFiles
        }
    }