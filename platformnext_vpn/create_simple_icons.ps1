# Simple icon creator for Platform Next VPN
Write-Host "Creating iOS app icons..." -ForegroundColor Green

$sourceIcon = "assets\images\icon.png"
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

# Check if source exists
if (-not (Test-Path $sourceIcon)) {
    Write-Host "ERROR: Source icon not found at $sourceIcon" -ForegroundColor Red
    exit 1
}

# Create directory if needed
if (-not (Test-Path $iconDir)) {
    New-Item -ItemType Directory -Path $iconDir -Force | Out-Null
}

# Copy source icon to all required sizes (simplified approach)
$iconSizes = @(
    "icon-20@2x.png", "icon-20@3x.png", "icon-29@2x.png", "icon-29@3x.png",
    "icon-40@2x.png", "icon-40@3x.png", "icon-60@2x.png", "icon-60@3x.png",
    "icon-20.png", "icon-29.png", "icon-40.png", "icon-76@2x.png", 
    "icon-83.5@2x.png", "icon-1024.png"
)

foreach ($iconFile in $iconSizes) {
    $targetPath = "$iconDir\$iconFile"
    Copy-Item $sourceIcon $targetPath -Force
    Write-Host "Created: $iconFile" -ForegroundColor Yellow
}

Write-Host "All icons created successfully!" -ForegroundColor Green
Write-Host "Note: All icons are the same size. For production, resize them properly." -ForegroundColor Yellow