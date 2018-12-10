[cmdletbinding()]

$userstodelete = $null

$userstodelete = Get-CIMinstance -class Win32_UserProfile | Where {((!$_.Special) `
-and ($_.LocalPath -ne "C:\Users\Default") -and ($_.LocalPath -ne "C:\Users\Public")  `
-and ($_.Loaded -eq $false))}


foreach ($u in $userstodelete) {
Write-verbose "$(Get-Date -Format g)"
Write-verbose "Deleting $($u.localpath)"
Remove-CimInstance -InputObject $u
}
