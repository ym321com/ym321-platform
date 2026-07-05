# Push to GitHub (origin) and GitLab (gitlab) — GitHub is source of truth
# Usage:
#   .\scripts\push-both.ps1
#   .\scripts\push-both.ps1 -Message "Update README"

param(
    [string]$Message = "",
    [string]$Branch = "main"
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path $PSScriptRoot -Parent
Set-Location $RepoRoot

$GitLabRemoteName = "gitlab"
$GitLabUrl = "https://gitlab.com/ym321com/ym321-platform.git"

git config user.name "ym321com"
git config user.email "noreply@ym321.com"

$remotes = git remote
if ($remotes -notcontains $GitLabRemoteName) {
    Write-Host "Adding remote '$GitLabRemoteName' -> $GitLabUrl"
    git remote add $GitLabRemoteName $GitLabUrl
} else {
    $current = (git remote get-url $GitLabRemoteName).Trim()
    if ($current -ne $GitLabUrl) {
        Write-Host "Updating remote '$GitLabRemoteName' URL"
        git remote set-url $GitLabRemoteName $GitLabUrl
    }
}

$status = git status --porcelain
if ($status) {
    if (-not $Message) {
        $Message = Read-Host "Enter commit message"
        if (-not $Message) {
            Write-Error "Commit message required."
            exit 1
        }
    }
    git add -A
    $msgFile = Join-Path $RepoRoot ".git\PUSH_MSG"
    [System.IO.File]::WriteAllText($msgFile, $Message)
    git commit --no-verify -F $msgFile
    Remove-Item $msgFile -Force -ErrorAction SilentlyContinue
    Write-Host "Committed."
} else {
    Write-Host "Working tree clean, pushing existing commits..."
}

Write-Host "`n>>> Pushing to GitHub (origin)..."
git push origin $Branch
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "`n>>> Pushing to GitLab ($GitLabRemoteName)..."
git push -u $GitLabRemoteName $Branch 2>$null
if ($LASTEXITCODE -ne 0) {
    git push $GitLabRemoteName $Branch
}
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "`nDone — synced to GitHub + GitLab on '$Branch'."
Write-Host "  GitHub: https://github.com/ym321com/ym321-platform"
Write-Host "  GitLab: https://gitlab.com/ym321com/ym321-platform"
git log -1 --oneline
