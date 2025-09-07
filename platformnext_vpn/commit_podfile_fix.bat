@echo off
echo ========================================
echo Platform Next VPN - Fix Podfile Error
echo ========================================
echo.

echo [1/4] Adding all changes to git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to git
    pause
    exit /b 1
)
echo   ✓ Files added to git

echo.
echo [2/4] Committing changes...
git commit -m "Fix Podfile Flutter root path error in GitHub Actions

- Updated build_ios.yml to regenerate Generated.xcconfig with correct macOS paths
- Added Flutter root path detection and correction
- Created test_podfile.yml for debugging Podfile issues
- Fixed Windows/Unix path conflicts in CI/CD

This should resolve the error:
'Invalid Podfile file: cannot load such file -- C:\flutter/packages/flutter_tools/bin/podhelper'"
if %errorlevel% neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)
echo   ✓ Changes committed

echo.
echo [3/4] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo WARNING: Failed to push to main, trying master...
    git push origin master
    if %errorlevel% neq 0 (
        echo ERROR: Failed to push to both main and master
        pause
        exit /b 1
    )
)
echo   ✓ Changes pushed to GitHub

echo.
echo [4/4] Checking git status...
git status

echo.
echo ========================================
echo ✓ Podfile fix committed and pushed!
echo ========================================
echo.
echo GitHub Actions will now:
echo 1. Run test_podfile.yml to debug Podfile setup
echo 2. Fix Generated.xcconfig with correct macOS paths
echo 3. Run pod install successfully
echo 4. Build iOS app without Podfile errors
echo.
echo Check the build status at:
echo https://github.com/YOUR_USERNAME/Plantform-Next/actions
echo.
echo The Podfile path error should now be fixed!
echo.
pause
