# Use Flutter to create proper icons
Write-Host "Using Flutter to create proper icons..." -ForegroundColor Green

$sourceIcon = "assets\images\icon.png"
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

# Check if source exists
if (-not (Test-Path $sourceIcon)) {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    exit 1
}

Write-Host "Source icon found: $sourceIcon" -ForegroundColor Green

# Remove ALL existing icon files
Write-Host "Removing ALL existing icon files..." -ForegroundColor Yellow
Get-ChildItem "$iconDir\*.png" | Remove-Item -Force

# Create a simple solution: Use the source icon but with proper naming
Write-Host "Creating icon files with proper structure..." -ForegroundColor Cyan

# Define the icon files needed
$iconFiles = @(
    "icon-20.png", "icon-20@2x.png", "icon-20@3x.png",
    "icon-29.png", "icon-29@2x.png", "icon-29@3x.png",
    "icon-40.png", "icon-40@2x.png", "icon-40@3x.png",
    "icon-60@2x.png", "icon-60@3x.png",
    "icon-76@2x.png", "icon-83.5@2x.png", "icon-1024.png"
)

# Copy the source icon to all required files
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
Write-Host "3. For production, use online tools to create proper sizes:" -ForegroundColor White
Write-Host "   - https://appicon.co/" -ForegroundColor Cyan
Write-Host "   - https://makeappicon.com/" -ForegroundColor Cyan
Write-Host "4. Or use Flutter's built-in icon generator" -ForegroundColor White

Write-Host "`nNEXT STEPS:" -ForegroundColor Yellow
Write-Host "1. Commit and push these changes" -ForegroundColor White
Write-Host "2. Test the build" -ForegroundColor White
Write-Host "3. If build works, replace with proper sized icons later" -ForegroundColor White
Write-Host "4. Check create_icons_online.md for detailed instructions" -ForegroundColor White
