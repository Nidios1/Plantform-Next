# Platform Next VPN - Real Icon Generator
# This script creates proper iOS app icons from the source icon

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Platform Next VPN - Real Icon Generator" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$sourceIcon = "assets\images\icon.png"
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

Write-Host "[1/4] Checking source icon..." -ForegroundColor Yellow
if (-not (Test-Path $sourceIcon)) {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    Write-Host "Please make sure assets/images/icon.png exists" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "  ✓ Source icon found: $sourceIcon" -ForegroundColor Green

Write-Host ""
Write-Host "[2/4] Creating icon directory..." -ForegroundColor Yellow
if (-not (Test-Path $iconDir)) {
    New-Item -ItemType Directory -Path $iconDir -Force | Out-Null
    Write-Host "  ✓ Created directory: $iconDir" -ForegroundColor Green
} else {
    Write-Host "  ✓ Directory exists: $iconDir" -ForegroundColor Green
}

Write-Host ""
Write-Host "[3/4] Creating iOS app icons..." -ForegroundColor Yellow

# Function to create icon with proper size
function Create-Icon {
    param(
        [string]$SourcePath,
        [string]$OutputPath,
        [int]$Size
    )
    
    try {
        # Load the source image
        $sourceImage = [System.Drawing.Image]::FromFile((Resolve-Path $SourcePath).Path)
        
        # Create a new bitmap with the desired size
        $newImage = New-Object System.Drawing.Bitmap($Size, $Size)
        $graphics = [System.Drawing.Graphics]::FromImage($newImage)
        
        # Set high quality rendering
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        
        # Draw the resized image
        $graphics.DrawImage($sourceImage, 0, 0, $Size, $Size)
        
        # Save the image
        $newImage.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
        
        # Clean up
        $graphics.Dispose()
        $newImage.Dispose()
        $sourceImage.Dispose()
        
        Write-Host "  [OK] Created: $OutputPath ($Size x $Size)" -ForegroundColor Green
    }
    catch {
        Write-Host "  [ERROR] Failed to create: $OutputPath - $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Create all required icon sizes
Write-Host "Creating iPhone icons..." -ForegroundColor Cyan
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-20@2x.png" -Size 40
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-20@3x.png" -Size 60
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-29@2x.png" -Size 58
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-29@3x.png" -Size 87
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-40@2x.png" -Size 80
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-40@3x.png" -Size 120
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-60@2x.png" -Size 120
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-60@3x.png" -Size 180

Write-Host "Creating iPad icons..." -ForegroundColor Cyan
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-20.png" -Size 20
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-20@2x.png" -Size 40
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-29.png" -Size 29
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-29@2x.png" -Size 58
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-40.png" -Size 40
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-40@2x.png" -Size 80
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-76@2x.png" -Size 152
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-83.5@2x.png" -Size 167

Write-Host "Creating App Store icon..." -ForegroundColor Cyan
Create-Icon -SourcePath $sourceIcon -OutputPath "$iconDir\icon-1024.png" -Size 1024

Write-Host ""
Write-Host "[4/4] Verifying icon files..." -ForegroundColor Yellow
$iconFiles = @(
    "icon-20@2x.png", "icon-20@3x.png", "icon-29@2x.png", "icon-29@3x.png",
    "icon-40@2x.png", "icon-40@3x.png", "icon-60@2x.png", "icon-60@3x.png",
    "icon-20.png", "icon-29.png", "icon-40.png", "icon-76@2x.png", 
    "icon-83.5@2x.png", "icon-1024.png"
)

$allIconsExist = $true
foreach ($iconFile in $iconFiles) {
    $iconPath = "$iconDir\$iconFile"
    if (Test-Path $iconPath) {
        $fileSize = (Get-Item $iconPath).Length
        if ($fileSize -gt 0) {
            Write-Host "  [OK] $iconFile ($fileSize bytes)" -ForegroundColor Green
        } else {
            Write-Host "  [ERROR] $iconFile (empty file)" -ForegroundColor Red
            $allIconsExist = $false
        }
    } else {
        Write-Host "  [ERROR] $iconFile (missing)" -ForegroundColor Red
        $allIconsExist = $false
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
if ($allIconsExist) {
    Write-Host "[SUCCESS] All iOS app icons created successfully!" -ForegroundColor Green
    Write-Host "[SUCCESS] App should now display proper icon and not crash" -ForegroundColor Green
} else {
    Write-Host "[WARNING] Some icons failed to create properly" -ForegroundColor Yellow
    Write-Host "[WARNING] Please check the errors above and try again" -ForegroundColor Yellow
}
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Clean and rebuild your iOS project" -ForegroundColor White
Write-Host "2. Run: flutter clean" -ForegroundColor White
Write-Host "3. Run: flutter pub get" -ForegroundColor White
Write-Host "4. Build iOS: flutter build ios" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to continue"
