@echo off
echo ========================================
echo Platform Next VPN - Cleanup Files
echo ========================================
echo.

echo [1/4] Deleting all .bat files...
del *.bat /Q
echo   ✓ Deleted .bat files

echo.
echo [2/4] Deleting all .ps1 files...
del *.ps1 /Q
echo   ✓ Deleted .ps1 files

echo.
echo [3/4] Deleting documentation files...
del *.md /Q
echo   ✓ Deleted .md files

echo.
echo [4/4] Checking remaining files...
dir /B

echo.
echo ========================================
echo ✓ Cleanup completed!
echo ========================================
echo.
echo REMAINING ESSENTIAL FILES:
echo ✅ pubspec.yaml (Flutter config)
echo ✅ lib/ (source code)
echo ✅ ios/ (iOS project)
echo ✅ android/ (Android project)
echo ✅ assets/ (images, fonts)
echo ✅ .github/ (GitHub Actions)
echo ✅ AppIcons.zip (icon files)
echo.
echo NOW YOU HAVE A CLEAN PROJECT!
echo.
pause
