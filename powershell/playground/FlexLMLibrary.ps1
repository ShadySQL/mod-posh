Function Get-FlexLMStatus
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : Get-FlexLMStatus
            Created by   : jspatton
            Date Coded   : 11/21/2011 13:02:14
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/Untitled2#Get-FlexLMStatus
    #>
    [cmdletBinding()]
    Param
        (
            [string]$LicenseServer
        )
    Begin
    {
        Write-Verbose "Check to see if LMTools are installed."
        try 
        {
            $LicenseStatus = lmutil lmstat -c $LicenseServer
            $LicenseStatus = $LicenseStatus -match '(\w:)'
            }
        catch
        {
            $Error[0].Exception.Message
            }
        }
    Process
    {   
        foreach ($line in $LicenseStatus)
        {
            if ($line.trim() |Select-String -Pattern "License file")
            {
                $LicenseFile = $line.Trim()
                $LicenseFile = $LicenseFile.Substring(19,$LicenseFile.Length-19)
                $LicenseFile = ($LicenseFile.Substring(($LicenseFile.IndexOfAny(":")+1),$LicenseFile.Length-($LicenseFile.IndexOfAny(":")+2))).Trim()
                }
            if ($line.Trim() |Select-String -Pattern " license server ")
            {
                $LicenseServerStatus = $line.Trim()
                $LicenseServerStatus = $LicenseServerStatus.Substring($LicenseServerStatus.IndexOfAny(":")+1,$LicenseServerStatus.Length-($LicenseServerStatus.IndexOfAny(":")+1)).Trim()
                }
            }
        }
    End
    {
        }
}

$Listening = netstat -an |Select-String -Pattern Listening
$Report = @()
foreach ($line in $Listening)
{
    [string]$thisline = $line
    $csv = (($thisline.Trim() -replace "\s *",",") -replace ":",",").Split(",")
    $LineItem = New-Object -TypeName PSObject -Property @{
        Protocol = $csv[0]
        LocalAddress = $csv[1]
        LocalPort = $csv[2]
        ForeignAddress = $csv[3]
        ForeignPort = $csv[4]
        State = $csv[5]
        }
    $Report += $LineItem
    }
$PortReport = @()
foreach ($port in ($Report |Select-Object -Property LocalPort))
{
    cmd /c echo lmstat -c "$($port.LocalPort)@license1"
    $Scan = cmd /c lmutil lmstat -c "$($port.LocalPort)@license1"
    $PortSCan = New-Object -TypeName PSObject -Property @{
        Report = $Scan
        Port = $Port.LocalPort
        Server = 'license1'
        }
    $PortReport += $PortSCan
    }