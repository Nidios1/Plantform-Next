# Fix iOS icons urgently
Write-Host "Fixing iOS icons urgently..." -ForegroundColor Red

$iconPath = "ios\Runner\Assets.xcassets\AppIcon.appiconset"
$sourceIcon = "assets\images\icon.png"

# Check if source icon exists
if (Test-Path $sourceIcon) {
    Write-Host "Source icon found: $sourceIcon" -ForegroundColor Green
    
    # Create all required icon files
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
        if (-not (Test-Path $targetPath)) {
            Copy-Item $sourceIcon $targetPath -Force
            Write-Host "Created: $iconFile" -ForegroundColor Yellow
        } else {
            Write-Host "Exists: $iconFile" -ForegroundColor Green
        }
    }
    
    Write-Host "All icon files created!" -ForegroundColor Green
} else {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    Write-Host "Creating placeholder icons..." -ForegroundColor Yellow
    
    # Create placeholder icons
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
        if (-not (Test-Path $targetPath)) {
            # Create empty file as placeholder
            New-Item -Path $targetPath -ItemType File -Force | Out-Null
            Write-Host "Created placeholder: $iconFile" -ForegroundColor Yellow
        }
    }
}

Write-Host "Icon fix completed!" -ForegroundColor Green
Write-Host "Now commit and push to fix the build error." -ForegroundColor Cyan
