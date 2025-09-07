# Cleanup all unnecessary files
Write-Host "Cleaning up all unnecessary files..." -ForegroundColor Green

# Files to keep (essential files)
$keepFiles = @(
    "pubspec.yaml",
    "lib/",
    "ios/",
    "android/",
    "assets/",
    ".github/workflows/build_ios.yml",
    "README.md",
    "AppIcons.zip"
)

# Files to delete (unnecessary files)
$deleteFiles = @(
    "*.bat",
    "*.ps1",
    "*.md",
    "create_*",
    "fix_*",
    "commit_*",
    "test_*",
    "cleanup_*",
    "use_*",
    "extract_*",
    "GITHUB_ACTIONS_FIX.md",
    "FLUTTER_PROJECT_ROOT_FIX.md",
    "PODFILE_PATH_FIX.md",
    "FINAL_FIX_COMPLETE.md",
    "BUILD_GUIDE.md",
    "create_icons_online.md",
    "IOS_ICON_CRASH_FIX.md",
    "PLUGIN_COMPATIBILITY_FIX.md",
    "PROJECT_SUMMARY.md",
    "TROUBLESHOOTING.md",
    "COMPLETE_BUILD_FIX.md",
    "BUILD_MODE_FIX.md",
    "IMPORT_ERROR_FIX.md",
    "APPICON_CONTENT_FIX.md",
    "IOS18_COMPATIBILITY.md",
    "GIT_GUIDE.md"
)

Write-Host "Files to delete:" -ForegroundColor Yellow
foreach ($pattern in $deleteFiles) {
    $files = Get-ChildItem -Path . -Name $pattern -Recurse -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        if ($file -notlike "lib/*" -and $file -notlike "ios/*" -and $file -notlike "android/*" -and $file -notlike "assets/*") {
            Write-Host "  - $file" -ForegroundColor Red
        }
    }
}

Write-Host "`nDeleting unnecessary files..." -ForegroundColor Cyan

# Delete files
foreach ($pattern in $deleteFiles) {
    $files = Get-ChildItem -Path . -Name $pattern -Recurse -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        if ($file -notlike "lib/*" -and $file -notlike "ios/*" -and $file -notlike "android/*" -and $file -notlike "assets/*") {
            try {
                Remove-Item $file -Force -Recurse -ErrorAction SilentlyContinue
                Write-Host "  [DELETED] $file" -ForegroundColor Red
            } catch {
                Write-Host "  [SKIPPED] $file" -ForegroundColor Yellow
            }
        }
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "[SUCCESS] Cleanup completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`nRemaining essential files:" -ForegroundColor Yellow
$remainingFiles = Get-ChildItem -Path . -Name | Where-Object { $_ -notlike ".*" }
foreach ($file in $remainingFiles) {
    Write-Host "  ✓ $file" -ForegroundColor Green
}

Write-Host "`nIMPORTANT:" -ForegroundColor Yellow
Write-Host "Only essential files remain:" -ForegroundColor White
Write-Host "- pubspec.yaml (Flutter config)" -ForegroundColor White
Write-Host "- lib/ (source code)" -ForegroundColor White
Write-Host "- ios/ (iOS project)" -ForegroundColor White
Write-Host "- android/ (Android project)" -ForegroundColor White
Write-Host "- assets/ (images, fonts)" -ForegroundColor White
Write-Host "- .github/workflows/build_ios.yml (build config)" -ForegroundColor White
Write-Host "- AppIcons.zip (icon files)" -ForegroundColor White
Write-Host "- README.md (documentation)" -ForegroundColor White
