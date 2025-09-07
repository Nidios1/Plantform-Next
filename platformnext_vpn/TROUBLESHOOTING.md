# Platform Next VPN - Hướng dẫn khắc phục sự cố

## Vấn đề: App bị crash khi mở

### Nguyên nhân chính:
1. **Plugin không được đăng ký đúng cách** - File `GeneratedPluginRegistrant.m` trống
2. **Thiếu quyền cần thiết** - Info.plist thiếu các permission descriptions
3. **Dependencies iOS chưa được cài đặt** - CocoaPods chưa được chạy

### Cách khắc phục:

#### Bước 1: Chạy script rebuild
```bash
# Trên Windows
rebuild_ios.bat

# Trên macOS/Linux
chmod +x rebuild_ios.sh
./rebuild_ios.sh
```

#### Bước 2: Kiểm tra các file quan trọng
1. **GeneratedPluginRegistrant.m** - Phải có nội dung đăng ký plugin
2. **Info.plist** - Phải có đầy đủ permission descriptions
3. **Podfile.lock** - Phải được tạo sau khi chạy `pod install`

#### Bước 3: Nếu vẫn bị crash
1. Xóa thư mục `ios/Pods`
2. Xóa file `ios/Podfile.lock`
3. Chạy lại `pod install`
4. Clean và rebuild project

### Các lỗi thường gặp:

#### Lỗi: "GeneratedPluginRegistrant.m is empty"
**Giải pháp:** Chạy `flutter clean` và `flutter pub get` trước khi build

#### Lỗi: "Permission denied" hoặc crash khi yêu cầu quyền
**Giải pháp:** Kiểm tra Info.plist có đầy đủ usage descriptions

#### Lỗi: "Plugin not found"
**Giải pháp:** Chạy `pod install` trong thư mục `ios/`

### Kiểm tra build thành công:
- File `Runner.app` được tạo trong `build/ios/Release-iphoneos/`
- Không có lỗi trong quá trình build
- App mở được trên device/simulator

### Liên hệ hỗ trợ:
Nếu vẫn gặp vấn đề, vui lòng cung cấp:
1. Log lỗi chi tiết
2. Phiên bản Flutter: `flutter --version`
3. Phiên bản Xcode (nếu build trên macOS)
4. Thiết bị đang test (iOS version)
