$Users = C:\scripts\powershell\playground\Get-UserLogonTimes.ps1 -SqlUser 'UserTraffic' -SqlPass 'Pass12345' -SqlServer 'sql.soecs.ku.edu' -SqlDatabase 'UserTraffic' -SqlTable 'AccountLogons'
$Users |Format-Table -AutoSize
$UserCount = ($Users |Sort-Object -Property AccountName -Unique).Count; Write-Host "$($UserCount) Users unique users have been logged"