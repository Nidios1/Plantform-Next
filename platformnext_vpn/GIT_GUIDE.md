# Hướng dẫn Git cho Platform Next VPN

## 📁 **Files nên COMMIT (tracked):**

### Core Files:
- `lib/main.dart` - Main app code
- `pubspec.yaml` - Dependencies và cấu hình
- `analysis_options.yaml` - Linting rules

### iOS Configuration:
- `ios/Runner/Info.plist` - App permissions và config
- `ios/Runner/AppDelegate.swift` - iOS app delegate
- `ios/Podfile` - CocoaPods dependencies
- `ios/Runner.xcodeproj/project.pbxproj` - Xcode project
- `ios/Runner.xcworkspace/contents.xcworkspacedata` - Workspace config

### Assets:
- `assets/core/` - Database files (geoip.db, geosite.db)
- `assets/flags/` - Country flag images
- `assets/fonts/` - Font files
- `assets/images/` - App icons và images

### Documentation:
- `README.md` - Project documentation
- `TROUBLESHOOTING.md` - Troubleshooting guide
- `rebuild_ios.bat` - Build script

### Configuration:
- `.gitignore` - Git ignore rules

## 🚫 **Files nên IGNORE (không commit):**

### Build Artifacts:
- `build/` - Flutter build output
- `.dart_tool/` - Dart tool cache
- `.flutter-plugins` - Generated plugin list
- `.flutter-plugins-dependencies` - Plugin dependencies
- `.packages` - Package cache
- `.pub-cache/` - Pub cache
- `.pub/` - Pub metadata

### iOS Build Files:
- `ios/Pods/` - CocoaPods dependencies (sẽ được tạo lại)
- `ios/DerivedData/` - Xcode build cache
- `ios/xcuserdata/` - User-specific Xcode settings
- `ios/.symlinks/` - Symbolic links
- `ios/Flutter/App.framework` - Generated framework
- `ios/Flutter/Flutter.framework` - Flutter framework
- `ios/Flutter/Flutter.podspec` - Generated podspec
- `ios/Flutter/Generated.xcconfig` - Generated config
- `ios/Flutter/ephemeral/` - Temporary files
- `ios/Runner/GeneratedPluginRegistrant.*` - Generated plugin files

### IDE Files:
- `.idea/` - IntelliJ/Android Studio
- `.vscode/` - VS Code settings
- `*.iml`, `*.ipr`, `*.iws` - IntelliJ files

### OS Files:
- `.DS_Store` - macOS
- `Thumbs.db` - Windows

### Logs & Temp:
- `*.log` - Log files
- `*.tmp`, `*.temp` - Temporary files

## 🔄 **Workflow Git:**

### Khi thêm file mới:
```bash
git add .
git commit -m "Add new feature"
git push
```

### Khi build app:
```bash
# Các file build sẽ tự động bị ignore
flutter build ios --release --no-codesign
```

### Khi cài dependencies:
```bash
# Pods sẽ được ignore, chỉ commit Podfile
cd ios && pod install
```

## ⚠️ **Lưu ý quan trọng:**

1. **KHÔNG commit** file `GeneratedPluginRegistrant.*` - sẽ được tạo lại
2. **KHÔNG commit** thư mục `Pods/` - chạy `pod install` để tạo lại
3. **KHÔNG commit** file build artifacts - sẽ được tạo khi build
4. **LUÔN commit** file cấu hình như `Info.plist`, `Podfile`, `pubspec.yaml`

## 📋 **Checklist trước khi commit:**

- [ ] Kiểm tra `git status` - chỉ thấy file cần thiết
- [ ] Không có file build artifacts
- [ ] Không có file IDE settings
- [ ] Không có file log hoặc temp
- [ ] Đã test app hoạt động bình thường
