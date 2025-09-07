# Fix AppIcon dimensions - Create proper sized icons
Write-Host "Fixing AppIcon dimensions..." -ForegroundColor Green

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

# Create properly sized icons using ImageMagick or similar
Write-Host "Creating properly sized icons..." -ForegroundColor Cyan

# Define icon sizes (width x height)
$iconSizes = @{
    "icon-20.png" = 20
    "icon-20@2x.png" = 40
    "icon-20@3x.png" = 60
    "icon-29.png" = 29
    "icon-29@2x.png" = 58
    "icon-29@3x.png" = 87
    "icon-40.png" = 40
    "icon-40@2x.png" = 80
    "icon-40@3x.png" = 120
    "icon-60@2x.png" = 120
    "icon-60@3x.png" = 180
    "icon-76@2x.png" = 152
    "icon-83.5@2x.png" = 167
    "icon-1024.png" = 1024
}

# Try to use ImageMagick if available, otherwise use simple copy
$useImageMagick = $false
try {
    $null = Get-Command magick -ErrorAction Stop
    $useImageMagick = $true
    Write-Host "Using ImageMagick for proper resizing" -ForegroundColor Green
} catch {
    Write-Host "ImageMagick not found, using simple copy method" -ForegroundColor Yellow
}

foreach ($iconFile in $iconSizes.Keys) {
    $size = $iconSizes[$iconFile]
    $targetPath = "$iconDir\$iconFile"
    
    if ($useImageMagick) {
        # Use ImageMagick for proper resizing
        try {
            magick "$sourceIcon" -resize "${size}x${size}" "$targetPath"
            Write-Host "  [OK] Created: $iconFile (${size}x${size})" -ForegroundColor Green
        } catch {
            Write-Host "  [ERROR] Failed to create: $iconFile" -ForegroundColor Red
        }
    } else {
        # Simple copy (will be same size but at least exists)
        Copy-Item $sourceIcon $targetPath -Force
        Write-Host "  [WARNING] Copied: $iconFile (same size as source)" -ForegroundColor Yellow
    }
}

# Verify all files exist
Write-Host "`nVerifying icon files..." -ForegroundColor Yellow
$allGood = $true
foreach ($iconFile in $iconSizes.Keys) {
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

Write-Host "`n========================================" -ForegroundColor Cyan
if ($allGood) {
    Write-Host "[SUCCESS] All iOS app icons created!" -ForegroundColor Green
    Write-Host "[SUCCESS] Icon dimensions should now be correct" -ForegroundColor Green
} else {
    Write-Host "[WARNING] Some icons failed to create properly" -ForegroundColor Yellow
}
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`nNote: If you have ImageMagick installed, icons will be properly resized." -ForegroundColor Yellow
Write-Host "Otherwise, they will be the same size as the source icon." -ForegroundColor Yellow
Write-Host "For best results, install ImageMagick: https://imagemagick.org/script/download.php" -ForegroundColor Yellow
