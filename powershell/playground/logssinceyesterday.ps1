$date = Get-Date
$logs = get-eventlog -list -ErrorAction SilentlyContinue
foreach ($log in $logs)
	{
		get-eventlog -logname $log.log -after $date.AddDays(-1).toshortdatestring() -ErrorAction SilentlyContinue
	}