# Sync skin preview images from marketing-site/pics into git-showcase/assets (+ docs/assets for GitHub Pages)
$RepoRoot = Split-Path $PSScriptRoot -Parent
$Src      = Join-Path (Split-Path $RepoRoot -Parent) "marketing-site\pics"
$Dst      = Join-Path $RepoRoot "assets"
$DocsDst  = Join-Path $RepoRoot "docs\assets"

if (-not (Test-Path $Src)) {
    Write-Error "Source not found: $Src"
    exit 1
}

foreach ($dir in @("$Dst\skins\phone", "$Dst\skins\pc", "$DocsDst\skins\phone", "$DocsDst\skins\pc")) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

$phoneFiles = @("KY1.png", "FSB1.png", "FSB2.png", "KY2.png", "OB1.png", "YY2.png")
$pcFiles    = @("MS01.jpg", "MS02.jpg", "VIP1.jpg", "OB.jpg", "JS.jpg", "VIP4.jpg")

Copy-Item "$Src\logo.png" "$Dst\logo.png" -Force
Copy-Item "$Src\logo.png" "$DocsDst\logo.png" -Force

foreach ($f in $phoneFiles) {
    Copy-Item "$Src\phone\$f" "$Dst\skins\phone\$f" -Force
    Copy-Item "$Src\phone\$f" "$DocsDst\skins\phone\$f" -Force
    Write-Host "  phone/$f"
}

foreach ($f in $pcFiles) {
    Copy-Item "$Src\pc\$f" "$Dst\skins\pc\$f" -Force
    Copy-Item "$Src\pc\$f" "$DocsDst\skins\pc\$f" -Force
    Write-Host "  pc/$f"
}

Write-Host "Done — assets + docs/assets synced from marketing-site/pics"
