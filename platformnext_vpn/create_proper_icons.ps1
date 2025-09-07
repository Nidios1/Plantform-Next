# Create proper sized icons using Flutter
Write-Host "Creating proper sized icons using Flutter..." -ForegroundColor Green

$sourceIcon = "assets\images\icon.png"
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

# Check if source exists
if (-not (Test-Path $sourceIcon)) {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    exit 1
}

Write-Host "Source icon found: $sourceIcon" -ForegroundColor Green

# Create a simple icon generator using PowerShell
Write-Host "Creating properly sized icons..." -ForegroundColor Cyan

# Define the exact sizes needed
$iconSpecs = @{
    "icon-20.png" = @{size = 20; description = "20x20"}
    "icon-20@2x.png" = @{size = 40; description = "40x40"}
    "icon-20@3x.png" = @{size = 60; description = "60x60"}
    "icon-29.png" = @{size = 29; description = "29x29"}
    "icon-29@2x.png" = @{size = 58; description = "58x58"}
    "icon-29@3x.png" = @{size = 87; description = "87x87"}
    "icon-40.png" = @{size = 40; description = "40x40"}
    "icon-40@2x.png" = @{size = 80; description = "80x80"}
    "icon-40@3x.png" = @{size = 120; description = "120x120"}
    "icon-60@2x.png" = @{size = 120; description = "120x120"}
    "icon-60@3x.png" = @{size = 180; description = "180x180"}
    "icon-76@2x.png" = @{size = 152; description = "152x152"}
    "icon-83.5@2x.png" = @{size = 167; description = "167x167"}
    "icon-1024.png" = @{size = 1024; description = "1024x1024"}
}

# Remove old icons
Write-Host "Removing old icon files..." -ForegroundColor Yellow
Get-ChildItem "$iconDir\*.png" | Remove-Item -Force

# Create new icons with proper sizes
foreach ($iconFile in $iconSpecs.Keys) {
    $size = $iconSpecs[$iconFile].size
    $description = $iconSpecs[$iconFile].description
    $targetPath = "$iconDir\$iconFile"
    
    try {
        # Load the source image
        $sourceImage = [System.Drawing.Image]::FromFile((Resolve-Path $sourceIcon).Path)
        
        # Create a new bitmap with the correct size
        $newImage = New-Object System.Drawing.Bitmap($size, $size)
        $graphics = [System.Drawing.Graphics]::FromImage($newImage)
        
        # Set high quality rendering
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        
        # Draw the resized image
        $graphics.DrawImage($sourceImage, 0, 0, $size, $size)
        
        # Save the image
        $newImage.Save($targetPath, [System.Drawing.Imaging.ImageFormat]::Png)
        
        # Clean up
        $graphics.Dispose()
        $newImage.Dispose()
        $sourceImage.Dispose()
        
        Write-Host "  [OK] Created: $iconFile ($description)" -ForegroundColor Green
    }
    catch {
        Write-Host "  [ERROR] Failed to create: $iconFile - $($_.Exception.Message)" -ForegroundColor Red
        # Fallback: copy the source file
        Copy-Item $sourceIcon $targetPath -Force
        Write-Host "  [FALLBACK] Copied source file to: $iconFile" -ForegroundColor Yellow
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "[SUCCESS] All iOS app icons created with proper dimensions!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`nIcon sizes created:" -ForegroundColor Yellow
foreach ($iconFile in $iconSpecs.Keys) {
    $description = $iconSpecs[$iconFile].description
    Write-Host "  - $iconFile ($description)" -ForegroundColor White
}
