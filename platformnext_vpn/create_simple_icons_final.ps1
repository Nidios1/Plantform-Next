# Create simple icons - temporary solution
Write-Host "Creating simple icons (temporary solution)..." -ForegroundColor Green

$sourceIcon = "assets\images\icon.png"
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

# Check if source exists
if (-not (Test-Path $sourceIcon)) {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    exit 1
}

Write-Host "Source icon found: $sourceIcon" -ForegroundColor Green

# Remove old icons
Write-Host "Removing old icon files..." -ForegroundColor Yellow
Get-ChildItem "$iconDir\*.png" | Remove-Item -Force

# Create simple icons (all same size for now)
$iconFiles = @(
    "icon-20.png", "icon-20@2x.png", "icon-20@3x.png",
    "icon-29.png", "icon-29@2x.png", "icon-29@3x.png",
    "icon-40.png", "icon-40@2x.png", "icon-40@3x.png",
    "icon-60@2x.png", "icon-60@3x.png",
    "icon-76@2x.png", "icon-83.5@2x.png", "icon-1024.png"
)

Write-Host "Creating icon files..." -ForegroundColor Cyan
foreach ($iconFile in $iconFiles) {
    $targetPath = "$iconDir\$iconFile"
    Copy-Item $sourceIcon $targetPath -Force
    Write-Host "  Created: $iconFile" -ForegroundColor Green
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "[SUCCESS] All iOS app icons created!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`nIMPORTANT NOTES:" -ForegroundColor Yellow
Write-Host "1. All icons are currently the same size (temporary solution)" -ForegroundColor White
Write-Host "2. This will cause warnings but the build should still work" -ForegroundColor White
Write-Host "3. For production, use proper icon sizes:" -ForegroundColor White
Write-Host "   - icon-20.png (20x20)" -ForegroundColor White
Write-Host "   - icon-20@2x.png (40x40)" -ForegroundColor White
Write-Host "   - icon-29@2x.png (58x58)" -ForegroundColor White
Write-Host "   - icon-40@2x.png (80x80)" -ForegroundColor White
Write-Host "   - icon-76@2x.png (152x152)" -ForegroundColor White
Write-Host "   - icon-1024.png (1024x1024)" -ForegroundColor White
Write-Host "`n4. Use online tools like https://appicon.co/ for proper resizing" -ForegroundColor White
