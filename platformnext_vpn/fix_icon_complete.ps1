# Complete icon fix for Platform Next VPN
Write-Host "Fixing iOS app icons completely..." -ForegroundColor Green

$sourceIcon = "assets\images\icon.png"
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

# Check if source exists
if (-not (Test-Path $sourceIcon)) {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    exit 1
}

Write-Host "Source icon found: $sourceIcon" -ForegroundColor Green

# Create directory if needed
if (-not (Test-Path $iconDir)) {
    New-Item -ItemType Directory -Path $iconDir -Force | Out-Null
    Write-Host "Created directory: $iconDir" -ForegroundColor Yellow
}

# Remove all existing icon files
Write-Host "Removing old icon files..." -ForegroundColor Yellow
Get-ChildItem "$iconDir\*.png" | Remove-Item -Force

# Create all required icon files
$iconFiles = @{
    "icon-20.png" = "20x20"
    "icon-20@2x.png" = "40x40"
    "icon-20@3x.png" = "60x60"
    "icon-29.png" = "29x29"
    "icon-29@2x.png" = "58x58"
    "icon-29@3x.png" = "87x87"
    "icon-40.png" = "40x40"
    "icon-40@2x.png" = "80x80"
    "icon-40@3x.png" = "120x120"
    "icon-60@2x.png" = "120x120"
    "icon-60@3x.png" = "180x180"
    "icon-76@2x.png" = "152x152"
    "icon-83.5@2x.png" = "167x167"
    "icon-1024.png" = "1024x1024"
}

Write-Host "Creating all required icon files..." -ForegroundColor Cyan
foreach ($iconFile in $iconFiles.Keys) {
    $targetPath = "$iconDir\$iconFile"
    Copy-Item $sourceIcon $targetPath -Force
    Write-Host "  Created: $iconFile ($($iconFiles[$iconFile]))" -ForegroundColor Green
}

# Verify all files exist and have content
Write-Host "`nVerifying icon files..." -ForegroundColor Yellow
$allGood = $true
foreach ($iconFile in $iconFiles.Keys) {
    $targetPath = "$iconDir\$iconFile"
    if (Test-Path $targetPath) {
        $fileSize = (Get-Item $targetPath).Length
        if ($fileSize -gt 0) {
            Write-Host "  [OK] $iconFile ($fileSize bytes)" -ForegroundColor Green
        } else {
            Write-Host "  [ERROR] $iconFile (empty file)" -ForegroundColor Red
            $allGood = $false
        }
    } else {
        Write-Host "  [ERROR] $iconFile (missing)" -ForegroundColor Red
        $allGood = $false
    }
}

# Check Contents.json
$contentsJson = "$iconDir\Contents.json"
if (Test-Path $contentsJson) {
    Write-Host "`n[OK] Contents.json exists" -ForegroundColor Green
} else {
    Write-Host "`n[ERROR] Contents.json missing" -ForegroundColor Red
    $allGood = $false
}

Write-Host "`n========================================" -ForegroundColor Cyan
if ($allGood) {
    Write-Host "[SUCCESS] All iOS app icons fixed successfully!" -ForegroundColor Green
    Write-Host "[SUCCESS] GitHub Actions build should now work" -ForegroundColor Green
} else {
    Write-Host "[WARNING] Some issues found, please check above" -ForegroundColor Yellow
}
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "1. Commit and push changes to GitHub" -ForegroundColor White
Write-Host "2. GitHub Actions will automatically rebuild" -ForegroundColor White
Write-Host "3. Check build status in GitHub Actions tab" -ForegroundColor White
