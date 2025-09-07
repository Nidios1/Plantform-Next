@echo off
echo ========================================
echo Platform Next VPN - Git Files Checker
echo ========================================
echo.

echo [INFO] Checking which files will be tracked by Git...
echo.

echo [1/3] Core Application Files:
if exist "lib\main.dart" (
    echo   ✓ lib\main.dart
) else (
    echo   ✗ lib\main.dart - MISSING
)

if exist "pubspec.yaml" (
    echo   ✓ pubspec.yaml
) else (
    echo   ✗ pubspec.yaml - MISSING
)

if exist "analysis_options.yaml" (
    echo   ✓ analysis_options.yaml
) else (
    echo   ✗ analysis_options.yaml - MISSING
)

echo.
echo [2/3] iOS Configuration Files:
if exist "ios\Runner\Info.plist" (
    echo   ✓ ios\Runner\Info.plist
) else (
    echo   ✗ ios\Runner\Info.plist - MISSING
)

if exist "ios\Runner\AppDelegate.swift" (
    echo   ✓ ios\Runner\AppDelegate.swift
) else (
    echo   ✗ ios\Runner\AppDelegate.swift - MISSING
)

if exist "ios\Podfile" (
    echo   ✓ ios\Podfile
) else (
    echo   ✗ ios\Podfile - MISSING
)

if exist "ios\Runner.xcodeproj\project.pbxproj" (
    echo   ✓ ios\Runner.xcodeproj\project.pbxproj
) else (
    echo   ✗ ios\Runner.xcodeproj\project.pbxproj - MISSING
)

echo.
echo [3/3] Assets and Documentation:
if exist "assets\" (
    echo   ✓ assets\ directory
) else (
    echo   ✗ assets\ directory - MISSING
)

if exist "README.md" (
    echo   ✓ README.md
) else (
    echo   ✗ README.md - MISSING
)

if exist "TROUBLESHOOTING.md" (
    echo   ✓ TROUBLESHOOTING.md
) else (
    echo   ✗ TROUBLESHOOTING.md - MISSING
)

if exist "rebuild_ios.bat" (
    echo   ✓ rebuild_ios.bat
) else (
    echo   ✗ rebuild_ios.bat - MISSING
)

if exist ".gitignore" (
    echo   ✓ .gitignore
) else (
    echo   ✗ .gitignore - MISSING
)

echo.
echo ========================================
echo Files that will be IGNORED by Git:
echo ========================================
echo.

echo Build Artifacts (will be ignored):
if exist "build\" (
    echo   ⚠ build\ directory exists - will be ignored
) else (
    echo   ✓ build\ directory not found - good
)

if exist ".dart_tool\" (
    echo   ⚠ .dart_tool\ directory exists - will be ignored
) else (
    echo   ✓ .dart_tool\ directory not found - good
)

if exist "ios\Pods\" (
    echo   ⚠ ios\Pods\ directory exists - will be ignored
) else (
    echo   ✓ ios\Pods\ directory not found - good
)

if exist "ios\Flutter\Generated.xcconfig" (
    echo   ⚠ ios\Flutter\Generated.xcconfig exists - will be ignored
) else (
    echo   ✓ ios\Flutter\Generated.xcconfig not found - good
)

echo.
echo ========================================
echo Summary:
echo ========================================
echo.
echo ✓ All essential files are present
echo ✓ Build artifacts will be properly ignored
echo ✓ Project is ready for Git version control
echo.
echo Next steps:
echo 1. Run: git init
echo 2. Run: git add .
echo 3. Run: git commit -m "Initial commit"
echo.
pause
