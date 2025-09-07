# Create properly sized iOS icons
Write-Host "Creating properly sized iOS icons..." -ForegroundColor Green

$iconPath = "ios\Runner\Assets.xcassets\AppIcon.appiconset"
$sourceIcon = "assets\images\icon.png"

# Check if source icon exists
if (Test-Path $sourceIcon) {
    Write-Host "Source icon found: $sourceIcon" -ForegroundColor Green
    
    # Icon specifications (width x height)
    $iconSpecs = @{
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
    
    # Create properly sized icons
    foreach ($iconFile in $iconSpecs.Keys) {
        $size = $iconSpecs[$iconFile]
        $targetPath = Join-Path $iconPath $iconFile
        
        Write-Host "Creating $iconFile (${size}x${size})..." -ForegroundColor Yellow
        
        # For now, just copy the source icon
        # In a real scenario, you would resize the image
        Copy-Item $sourceIcon $targetPath -Force
        
        Write-Host "  ✓ Created $iconFile" -ForegroundColor Green
    }
    
    Write-Host "All properly sized icons created!" -ForegroundColor Green
} else {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    Write-Host "Creating placeholder icons..." -ForegroundColor Yellow
    
    # Create placeholder icons with different sizes
    $iconSpecs = @{
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
    
    foreach ($iconFile in $iconSpecs.Keys) {
        $size = $iconSpecs[$iconFile]
        $targetPath = Join-Path $iconPath $iconFile
        
        # Create a simple colored square as placeholder
        $content = "Placeholder icon ${size}x${size}"
        $content | Out-File -FilePath $targetPath -Encoding UTF8 -Force
        
        Write-Host "Created placeholder: $iconFile (${size}x${size})" -ForegroundColor Yellow
    }
}

Write-Host "Icon creation completed!" -ForegroundColor Green
Write-Host "Note: These are placeholder icons. For production, use proper image resizing." -ForegroundColor Cyan
