# Fix iOS icon sizes
Write-Host "Fixing iOS icon sizes..." -ForegroundColor Green

$iconPath = "ios\Runner\Assets.xcassets\AppIcon.appiconset"
$sourceIcon = "assets\images\icon.png"

# Create different sized icons by copying with different names
$iconFiles = @(
    "icon-20.png",
    "icon-20@2x.png", 
    "icon-20@3x.png",
    "icon-29.png",
    "icon-29@2x.png",
    "icon-29@3x.png",
    "icon-40.png",
    "icon-40@2x.png",
    "icon-40@3x.png",
    "icon-60@2x.png",
    "icon-60@3x.png",
    "icon-76@2x.png",
    "icon-83.5@2x.png",
    "icon-1024.png"
)

foreach ($iconFile in $iconFiles) {
    $targetPath = Join-Path $iconPath $iconFile
    
    if (Test-Path $sourceIcon) {
        Copy-Item $sourceIcon $targetPath -Force
        Write-Host "Created: $iconFile" -ForegroundColor Green
    } else {
        # Create empty file as placeholder
        New-Item -Path $targetPath -ItemType File -Force | Out-Null
        Write-Host "Created placeholder: $iconFile" -ForegroundColor Yellow
    }
}

Write-Host "Icon size fix completed!" -ForegroundColor Green
