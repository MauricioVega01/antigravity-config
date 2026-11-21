$rules = Join-Path $HOME '.gemini\AGENTS.md'
$skills = Join-Path $HOME '.gemini\config\skills'
Write-Host "Global rule: $(Test-Path -LiteralPath $rules) -> $rules"
if (Test-Path -LiteralPath $skills) {
    Get-ChildItem -LiteralPath $skills -Directory | ForEach-Object {
        $manifest = Join-Path $_.FullName 'SKILL.md'
        $ok = (Test-Path -LiteralPath $manifest)
        Write-Host "Skill $($_.Name): $ok"
    }
} else { Write-Host 'No global skill directory.' }
Write-Host 'This checks files only. Confirm agent discovery inside Antigravity Customizations.'
