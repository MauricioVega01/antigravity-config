# Test-Configuration.ps1 - Diagnostico integral de Antigravity
$ErrorActionPreference = 'SilentlyContinue'

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  DIAGNOSTICO DE ENTORNO ANTIGRAVITY    " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# 1. Reglas Globales
$rulesPath = Join-Path $HOME '.gemini\AGENTS.md'
if (Test-Path -LiteralPath $rulesPath) {
    $lineCount = (Get-Content -LiteralPath $rulesPath).Count
    Write-Host "[OK] Regla Global instalada ($lineCount lineas) -> $rulesPath" -ForegroundColor Green
} else {
    Write-Host "[ALERTA] Regla Global NO encontrada en $rulesPath" -ForegroundColor Red
}

# 2. Servidores MCP
$mcpPath = Join-Path $HOME '.gemini\config\mcp_config.json'
if (Test-Path -LiteralPath $mcpPath) {
    try {
        $mcpContent = Get-Content -LiteralPath $mcpPath -Raw | ConvertFrom-Json
        $serverNames = $mcpContent.mcpServers.PSObject.Properties.Name
        if ($serverNames -and $serverNames.Count -gt 0) {
            $namesStr = $serverNames -join ', '
            Write-Host "[OK] MCPs Configurados ($($serverNames.Count)): $namesStr" -ForegroundColor Green
        } else {
            Write-Host "[INFO] Archivo mcp_config.json presente pero sin servidores activos." -ForegroundColor Yellow
        }
    } catch {
        Write-Host "[ERROR] Error parseando mcp_config.json" -ForegroundColor Red
    }
} else {
    Write-Host "[INFO] No existe mcp_config.json en ~/.gemini/config/" -ForegroundColor Yellow
}

# 3. Skills Globales
$skillsDir = Join-Path $HOME '.gemini\config\skills'
if (Test-Path -LiteralPath $skillsDir) {
    $skills = Get-ChildItem -LiteralPath $skillsDir -Directory
    $validSkills = $skills | Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }
    Write-Host "[OK] Skills Globales ($($validSkills.Count) activas):" -ForegroundColor Green
    $validSkills | ForEach-Object { Write-Host "   - $($_.Name)" -ForegroundColor Gray }
} else {
    Write-Host "[ALERTA] No se encontro directorio de skills en $skillsDir" -ForegroundColor Red
}

# 4. Estado de Git en el repositorio
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "Estado del Repositorio de Configuracion:" -ForegroundColor Cyan
$repoDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
if (Test-Path (Join-Path $repoDir '.git')) {
    $branch = git -C $repoDir branch --show-current 2>$null
    $remote = git -C $repoDir remote get-url origin 2>$null
    Write-Host "   Rama activa: $branch" -ForegroundColor White
    Write-Host "   Remoto origin: $remote" -ForegroundColor White
} else {
    Write-Host "   [INFO] Git no inicializado en este repositorio." -ForegroundColor Yellow
}

# 5. Entornos del Sistema
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "Entornos del Sistema:" -ForegroundColor Cyan
$nodeV = (node -v 2>$null)
$pyV = (python --version 2>$null)
$gitV = (git --version 2>$null)
Write-Host "   Node.js: $(if ($nodeV) { $nodeV } else { 'No detectado' })" -ForegroundColor Gray
Write-Host "   Python:  $(if ($pyV) { $pyV } else { 'No detectado' })" -ForegroundColor Gray
Write-Host "   Git:     $(if ($gitV) { $gitV } else { 'No detectado' })" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Cyan
