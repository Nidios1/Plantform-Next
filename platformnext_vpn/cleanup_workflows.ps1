# Cleanup GitHub Actions workflows - Keep only the best one
Write-Host "Cleaning up GitHub Actions workflows..." -ForegroundColor Yellow

$workflowsDir = ".github\workflows"
$keepFile = "simple_build.yml"  # This is the best workflow

# List all workflow files
$allFiles = Get-ChildItem $workflowsDir -Name "*.yml"
Write-Host "Found workflow files:" -ForegroundColor Cyan
foreach ($file in $allFiles) {
    Write-Host "  - $file" -ForegroundColor White
}

Write-Host "`nKeeping only: $keepFile" -ForegroundColor Green

# Remove all files except the one we want to keep
foreach ($file in $allFiles) {
    if ($file -ne $keepFile) {
        $filePath = "$workflowsDir\$file"
        if (Test-Path $filePath) {
            Remove-Item $filePath -Force
            Write-Host "  Removed: $file" -ForegroundColor Red
        }
    }
}

Write-Host "`nRemaining workflow files:" -ForegroundColor Cyan
$remainingFiles = Get-ChildItem $workflowsDir -Name "*.yml"
foreach ($file in $remainingFiles) {
    Write-Host "  [OK] $file" -ForegroundColor Green
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "✓ Cleanup completed!" -ForegroundColor Green
Write-Host "Only $keepFile remains - this is the best workflow" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
