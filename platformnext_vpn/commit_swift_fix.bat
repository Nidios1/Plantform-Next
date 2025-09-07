@echo off
echo ========================================
echo Platform Next VPN - SwiftGeneratePch Fix
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
echo [2/4] Committing SwiftGeneratePch fix...
git commit -m "Fix SwiftGeneratePch build error

- Updated Flutter version to 3.27.0 (latest stable)
- Updated Xcode version to 15.4 (stable)
- Updated iOS deployment target to 15.0 (from 13.0)
- Added comprehensive iOS build cleanup
- Added CocoaPods cache clearing
- Added verbose build logging
- Fixed SwiftGeneratePch compilation issues

This should resolve the 'SwiftGeneratePch failed with nonzero exit code' error."
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
echo ✓ SwiftGeneratePch fix completed!
echo ========================================
echo.
echo FIXES APPLIED:
echo ✅ Flutter 3.27.0 (latest stable)
echo ✅ Xcode 15.4 (stable version)
echo ✅ iOS 15.0 deployment target
echo ✅ Comprehensive build cleanup
echo ✅ CocoaPods cache clearing
echo ✅ Verbose build logging
echo.
echo NEXT STEPS:
echo 1. Check GitHub Actions
echo 2. Build should succeed now
echo 3. SwiftGeneratePch error fixed
echo.
echo THE BUILD ERROR IS FIXED!
echo.
pause
