while ($true) {
    if (-not (Get-Process -Name "notepad" -ErrorAction SilentlyContinue)) {
        Start-Process -FilePath "C:\Windows\System32\notepad.exe"
    }
    Start-Sleep -Seconds 10
}
