# Sincroniza permissions.json -> ~/.claude/settings.json
$permissionsFile = "$PSScriptRoot\permissions.json"
$settingsFile = "$env:USERPROFILE\.claude\settings.json"
$settingsLocalFile = "$env:USERPROFILE\.claude\settings.local.json"

$permissions = Get-Content $permissionsFile -Raw | ConvertFrom-Json
$settings = Get-Content $settingsFile -Raw | ConvertFrom-Json

$before = $settings.permissions.allow

$profileWindows = $env:USERPROFILE
$profileUnix = $profileWindows
if ($profileWindows -match '^([A-Za-z]):\\(.+)$') {
    $profileUnix = '//' + $matches[1].ToLower() + '/' + ($matches[2] -replace '\\', '/')
}

$settings.permissions.allow = @(
    $permissions.allow | ForEach-Object {
        $_.
            Replace('C:\Users\sergi', $profileWindows).
            Replace('//c/Users/sergi', $profileUnix)
    }
)

$settings | ConvertTo-Json -Depth 10 | Out-File $settingsFile -Encoding utf8

# Esvazia settings.local.json se tiver permissões
if (Test-Path $settingsLocalFile) {
    $local = Get-Content $settingsLocalFile -Raw | ConvertFrom-Json
    if ($local.permissions.allow.Count -gt 0) {
        $local.permissions.allow = @()
        $local | ConvertTo-Json -Depth 10 | Out-File $settingsLocalFile -Encoding utf8
        Write-Host "settings.local.json limpo."
    }
}

$added   = $permissions.allow | Where-Object { $_ -notin $before }
$removed = $before | Where-Object { $_ -notin $permissions.allow }

Write-Host "`nsettings.json atualizado."
if ($added)   { Write-Host "`nAdicionadas:"; $added   | ForEach-Object { Write-Host "  + $_" } }
if ($removed) { Write-Host "`nRemovidas:";  $removed  | ForEach-Object { Write-Host "  - $_" } }
if (-not $added -and -not $removed) { Write-Host "Nenhuma alteracao." }
