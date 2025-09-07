@echo off
echo ========================================
echo Platform Next VPN - Commit and Push
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
git commit -m "Fix iOS app icons and GitHub Actions build

- Fixed AppIcon set with proper icon files
- All required icon sizes now present (20x20 to 1024x1024)
- Updated GitHub Actions workflow for iOS build
- Improved error handling in main.dart
- Added complete icon generation scripts

This should resolve the Xcode build error:
'The stickers icon set or app icon set named AppIcon did not have any applicable content.'"
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
echo ✓ All changes committed and pushed!
echo ========================================
echo.
echo GitHub Actions will now automatically:
echo 1. Detect the push
echo 2. Start the build-ios workflow
echo 3. Build the iOS app with fixed icons
echo.
echo Check the build status at:
echo https://github.com/YOUR_USERNAME/Plantform-Next/actions
echo.
echo The build should now succeed without the AppIcon error!
echo.
pause
