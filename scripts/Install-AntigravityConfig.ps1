[CmdletBinding(SupportsShouldProcess=$true)]
param(
    [switch]$Force,
    [switch]$RulesOnly
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$srcRules = Join-Path $repo 'global\AGENTS.md'
$srcSkills = Join-Path $repo 'global\skills'
$homeGemini = Join-Path $HOME '.gemini'
$destRule = Join-Path $homeGemini 'AGENTS.md'
$destSkills = Join-Path $homeGemini 'config\skills'
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$backupDir = Join-Path $repo "backups\$stamp"
function Install-SafeFile($source, $destination) {
    if (Test-Path -LiteralPath $destination) {
        $same = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash -eq (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash
        if ($same) { Write-Host "Unchanged: $destination"; return }
        if (-not $Force) { Write-Warning "Skipped existing file (use -Force to back up and replace): $destination"; return }
        if ($PSCmdlet.ShouldProcess($destination, 'Backup and overwrite')) {
            New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
            $bak = Join-Path $backupDir ([Guid]::NewGuid().ToString('N') + '-' + [IO.Path]::GetFileName($destination))
            Copy-Item -LiteralPath $destination -Destination $bak
            Write-Host "Backup: $bak"
        } else { return }
    }
    if ($PSCmdlet.ShouldProcess($destination, 'Install configuration file')) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
        Copy-Item -LiteralPath $source -Destination $destination
        Write-Host "Installed: $destination"
    }
}
Install-SafeFile $srcRules $destRule
if (-not $RulesOnly) {
    Get-ChildItem -LiteralPath $srcSkills -Directory | ForEach-Object {
        $skillDestination = Join-Path (Join-Path $destSkills $_.Name) 'SKILL.md'
        Install-SafeFile (Join-Path $_.FullName 'SKILL.md') $skillDestination
    }
}
Write-Host 'Finished. Restart/reopen Antigravity and verify Rules/Skills in Customizations.'
Write-Host 'MCP and account-specific credentials were NOT modified.'
