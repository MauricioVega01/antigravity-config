[CmdletBinding(SupportsShouldProcess=$true)]
param([Parameter(Mandatory=$true)][string]$ProjectPath, [switch]$Force)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$src = Join-Path $repo 'templates\breakingchains'
if (-not (Test-Path -LiteralPath $ProjectPath -PathType Container)) { throw 'Project folder does not exist.' }
$dest = (Resolve-Path -LiteralPath $ProjectPath).Path
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$backupDir = Join-Path $repo "backups\breakingchains-$stamp"
$files = Get-ChildItem -LiteralPath $src -Recurse -File
foreach ($file in $files) {
    $relative = $file.FullName.Substring($src.Length).TrimStart('\','/')
    $target = Join-Path $dest $relative
    if (Test-Path -LiteralPath $target) {
        if ((Get-FileHash $file.FullName -Algorithm SHA256).Hash -eq (Get-FileHash $target -Algorithm SHA256).Hash) { continue }
        if (-not $Force) { Write-Warning "Skipped existing project configuration: $target"; continue }
        if ($PSCmdlet.ShouldProcess($target, 'Backup and overwrite')) {
            $bak = Join-Path $backupDir $relative
            New-Item -ItemType Directory -Force -Path (Split-Path -Parent $bak) | Out-Null
            Copy-Item -LiteralPath $target -Destination $bak
        } else { continue }
    }
    if ($PSCmdlet.ShouldProcess($target,'Install BreakingChains project configuration')) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $target
        Write-Host "Installed: $target"
    }
}
Write-Host 'Only AGENTS.md and .agents/skills were handled. No application code or user data modified.'
