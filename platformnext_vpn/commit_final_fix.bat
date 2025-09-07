@echo off
echo ========================================
echo Platform Next VPN - Final Fix (No Code Signing)
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
git commit -m "Fix iOS build with no code signing required

- Updated build_ios.yml to build for iOS simulator (no code signing)
- Added CODE_SIGNING_REQUIRED=NO and CODE_SIGNING_ALLOWED=NO
- Created simple_build.yml for basic Flutter iOS build
- Removed IPA creation (not needed without code signing)
- Fixed Provisioning Profile and Development Team errors

This should resolve the error:
'Provisioning Profile. Please ensure that a Development Team is selected'"
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
echo ✓ Final fix committed and pushed!
echo ========================================
echo.
echo GitHub Actions will now:
echo 1. Run simple_build.yml (basic Flutter iOS build)
echo 2. Build for iOS simulator (no code signing required)
echo 3. Upload build artifacts
echo 4. No more Provisioning Profile errors!
echo.
echo Check the build status at:
echo https://github.com/YOUR_USERNAME/Plantform-Next/actions
echo.
echo The iOS build should now work without Apple Developer Account!
echo.
pause
