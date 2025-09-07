@echo off
echo ========================================
echo Platform Next VPN - IPA Build Setup
echo ========================================
echo.

echo [1/4] Adding all changes to git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to git
    echo.
    echo SOLUTION: Upload manually to GitHub
    echo 1. Go to: https://github.com/Nidios1/Plantform-Next
    echo 2. Click "Add file" - "Upload files"
    echo 3. Upload: .github/workflows/build_ios.yml
    echo 4. Upload: ios/ExportOptions.plist
    echo 5. Commit message: "Add IPA build support"
    echo.
    pause
    exit /b 1
)
echo   ✓ Files added to git

echo.
echo [2/4] Committing IPA build setup...
git commit -m "Add IPA build support

- Build for iOS device (release mode, no code signing)
- Create IPA file using xcodebuild
- Export IPA without code signing
- Added ExportOptions.plist for IPA export
- Upload IPA file as build artifact
- Ready for iPhone installation

This will create a .ipa file that can be installed on iPhone."
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
        echo.
        echo MANUAL UPLOAD REQUIRED:
        echo 1. Go to: https://github.com/Nidios1/Plantform-Next
        echo 2. Click "Add file" - "Upload files"
        echo 3. Upload the modified files
        echo 4. Commit with message: "Add IPA build support"
        echo.
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
echo ✓ IPA build setup completed!
echo ========================================
echo.
echo IPA BUILD FEATURES:
echo ✅ Build for iOS device (release mode)
echo ✅ Create IPA file using xcodebuild
echo ✅ Export IPA without code signing
echo ✅ Upload IPA as build artifact
echo ✅ Ready for iPhone installation
echo.
echo HOW TO GET IPA FILE:
echo 1. Check GitHub Actions after build
echo 2. Go to "Actions" tab
echo 3. Click on successful build
echo 4. Download "ios-ipa-build" artifact
echo 5. Extract .ipa file
echo.
echo INSTALL ON IPHONE:
echo 1. Use AltStore, Sideloadly, or similar
echo 2. Install the .ipa file
echo 3. App will appear on iPhone
echo.
echo THE IPA BUILD IS READY!
echo.
pause
