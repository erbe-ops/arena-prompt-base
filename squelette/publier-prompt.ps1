# publier-prompt.ps1 — publie la copie locale du prompt vers arena-prompt-base (DEPUIS LE PC)
# Usage : powershell -File scripts\publier-prompt.ps1 -Note "ce qui change"
# Le numéro de version est lu dans l'en-tête du fichier local (# Version X.YY ...).
# A VALIDER a la premiere utilisation réelle (20260903).

param(
    [string]$Note = "mise a jour",
    [string]$Base = "$HOME\arena-prompt-base"
)

$ErrorActionPreference = 'Stop'
$Local = Join-Path $PSScriptRoot '..\00.prompt.base.Github.md' | Resolve-Path

if (-not (Test-Path $Base)) {
    Write-Host "Clone absent : git clone https://github.com/erbe-ops/arena-prompt-base $Base"
    git clone https://github.com/erbe-ops/arena-prompt-base $Base
}
Push-Location $Base
git pull --rebase

# 1. Copier la copie locale du projet
Copy-Item $Local '00.prompt.base.Github.md' -Force

# 2. Lire le numero de version dans l'en-tête (# Version 1.18 - ...)
$hdr = Select-String -Path '00.prompt.base.Github.md' -Pattern '^# Version (\d+\.\d+)' | Select-Object -First 1
if (-not $hdr) { throw "En-tete '# Version X.YY' introuvable dans le fichier local." }
$v = $hdr.Matches[0].Groups[1].Value

# 3. Mettre a jour la ligne "Version courante" du README (seule ligne commençant par **vX.Y**)
$readme = Get-Content 'README.md'
$readme = $readme -replace '^\*\*v[\d.]+\*\*(\s*—.*)$', "**v$v**`$1"
Set-Content 'README.md' $readme

# 4. Commit + push
git add -A
git commit -m "v$v - $Note"
git push
Pop-Location
Write-Host "Publie : v$v - $Note"
