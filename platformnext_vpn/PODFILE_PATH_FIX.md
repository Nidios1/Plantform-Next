# Fix Podfile Flutter Root Path Error

## 🚨 Lỗi mới
```
Invalid `Podfile` file: cannot load such file -- /Users/runner/work/Plantform-Next/Plantform-Next/platformnext_vpn/ios/C:\flutter/packages/flutter_tools/bin/podhelper.
```

## 🔍 Nguyên nhân
- File `Generated.xcconfig` có đường dẫn Windows (`C:\flutter`)
- GitHub Actions chạy trên macOS với đường dẫn Unix
- Podfile cố gắng load `podhelper` từ đường dẫn Windows không tồn tại trên macOS

## ✅ Đã sửa

### 1. **Cập nhật build_ios.yml**
- ✅ Thêm step để regenerate Flutter configuration files
- ✅ Detect Flutter root path đúng cho macOS
- ✅ Update `Generated.xcconfig` với đường dẫn Unix
- ✅ Chạy `flutter clean` và `flutter pub get` trước pod install

### 2. **Tạo test_podfile.yml**
- ✅ Workflow đơn giản để debug Podfile setup
- ✅ Test Flutter root path detection
- ✅ Test Generated.xcconfig creation/update
- ✅ Test pod install riêng biệt

### 3. **Scripts hỗ trợ**
- ✅ `commit_podfile_fix.bat` - Commit và push changes
- ✅ Debug steps trong workflow

## 🚀 Cách sử dụng

### Bước 1: Commit và push changes
```bash
# Chạy script tự động
commit_podfile_fix.bat

# Hoặc thủ công
git add .
git commit -m "Fix Podfile Flutter root path error in GitHub Actions"
git push origin main
```

### Bước 2: Kiểm tra GitHub Actions
1. Vào repository trên GitHub
2. Tab "Actions" → "Test Podfile Fix" (workflow mới)
3. Xem logs để debug Podfile setup
4. Sau đó chạy "Build iOS App" workflow

## 📱 Kết quả mong đợi

### ✅ Test Podfile Fix workflow sẽ:
- ✅ Detect Flutter root path đúng cho macOS
- ✅ Update Generated.xcconfig với đường dẫn Unix
- ✅ Chạy pod install thành công
- ✅ Không còn lỗi "cannot load such file"

### ✅ Build iOS App workflow sẽ:
- ✅ Regenerate Flutter configuration files
- ✅ Fix Generated.xcconfig paths
- ✅ Chạy pod install thành công
- ✅ Build iOS app thành công

## 🔧 Troubleshooting

### Nếu vẫn lỗi "cannot load such file":
1. **Kiểm tra Flutter root path**:
   ```bash
   # Trong GitHub Actions logs, xem output của step "Fix Generated.xcconfig"
   ```

2. **Kiểm tra Generated.xcconfig**:
   ```bash
   # Đảm bảo FLUTTER_ROOT có đường dẫn Unix đúng
   ```

3. **Kiểm tra Podfile**:
   ```bash
   # Đảm bảo Podfile có thể load podhelper từ Flutter root
   ```

### Nếu pod install vẫn fail:
1. **Kiểm tra CocoaPods version**:
   ```bash
   # Có thể cần update CocoaPods
   ```

2. **Kiểm tra iOS deployment target**:
   ```bash
   # Đảm bảo iOS 15.0+ được support
   ```

## 📝 Ghi chú quan trọng

- **Path conflict**: Windows paths trong Generated.xcconfig gây lỗi trên macOS
- **Flutter root detection**: Sử dụng `which flutter` để tìm đúng path
- **Generated.xcconfig**: File này được tạo bởi `flutter pub get`
- **Podfile dependency**: Podfile phụ thuộc vào Generated.xcconfig

## 🎯 Trạng thái hiện tại

- ✅ **Podfile path error**: Đã sửa
- ✅ **Generated.xcconfig**: Đã cập nhật logic
- ✅ **Workflow paths**: Đã sửa
- ✅ **Debug workflow**: Đã tạo
- ⏳ **Cần**: Commit và push để test

## 🔗 Workflow files

1. **test_podfile.yml** - Debug và test Podfile setup
2. **build_ios.yml** - Build iOS app chính thức (đã cập nhật)
3. **commit_podfile_fix.bat** - Script commit và push

## 📊 Expected workflow flow

```
1. Checkout repository
2. Setup Flutter 3.24.0
3. Find Flutter project (platformnext_vpn/)
4. Get dependencies (flutter pub get)
5. Setup Xcode
6. Prepare iOS build:
   - Regenerate Flutter config files
   - Fix Generated.xcconfig paths
   - Run pod install
7. Build iOS app (flutter build ios)
8. Create IPA
9. Upload artifact
```

## 🔧 Technical details

### Generated.xcconfig fix:
```bash
# Detect correct Flutter root for macOS
FLUTTER_ROOT_PATH=$(which flutter | sed 's|/bin/flutter||')

# Update Generated.xcconfig
sed -i.bak "s|FLUTTER_ROOT=.*|FLUTTER_ROOT=$FLUTTER_ROOT_PATH|" ios/Flutter/Generated.xcconfig
sed -i.bak "s|FLUTTER_APPLICATION_PATH=.*|FLUTTER_APPLICATION_PATH=$(pwd)|" ios/Flutter/Generated.xcconfig
```

### Before fix:
```
FLUTTER_ROOT=C:\flutter  # Windows path - WRONG
```

### After fix:
```
FLUTTER_ROOT=/Users/runner/hostedtoolcache/flutter/3.24.0-stable  # Unix path - CORRECT
```
