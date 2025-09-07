@echo off
echo ========================================
echo Platform Next VPN - Fix GitHub Actions
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
git commit -m "Fix GitHub Actions Flutter project root error

- Updated build_ios.yml to find Flutter project dynamically
- Added debug steps to identify project structure
- Created test_build.yml for debugging
- Fixed path issues in workflow steps

This should resolve the error:
'Expected to find project root in current working directory.'"
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
echo ✓ Fix committed and pushed!
echo ========================================
echo.
echo GitHub Actions will now:
echo 1. Run the test_build.yml workflow first
echo 2. Debug the directory structure
echo 3. Find the correct Flutter project
echo 4. Run flutter commands successfully
echo.
echo Check the build status at:
echo https://github.com/YOUR_USERNAME/Plantform-Next/actions
echo.
echo The 'Expected to find project root' error should now be fixed!
echo.
pause
