# Tạo Icon Đúng Kích Thước - Hướng Dẫn

## 🚨 Vấn đề hiện tại
- Icon có kích thước 512x512 thay vì kích thước đúng
- Build bị lỗi: "is 512x512 but should be 152x152"
- Cần tạo icon với kích thước chính xác

## 🎯 Giải pháp: Sử dụng Online Tool

### Bước 1: Chuẩn bị icon gốc
- File: `assets/images/icon.png`
- Kích thước: 1024x1024 (khuyến nghị)

### Bước 2: Sử dụng AppIcon.co
1. Vào: https://appicon.co/
2. Upload file `assets/images/icon.png`
3. Chọn "iOS" platform
4. Download zip file

### Bước 3: Giải nén và copy
1. Giải nén zip file
2. Copy tất cả file .png vào: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

### Bước 4: Kiểm tra kích thước
Các file cần có kích thước chính xác:
- `icon-20.png` (20x20)
- `icon-20@2x.png` (40x40)
- `icon-20@3x.png` (60x60)
- `icon-29.png` (29x29)
- `icon-29@2x.png` (58x58)
- `icon-29@3x.png` (87x87)
- `icon-40.png` (40x40)
- `icon-40@2x.png` (80x80)
- `icon-40@3x.png` (120x120)
- `icon-60@2x.png` (120x120)
- `icon-60@3x.png` (180x180)
- `icon-76@2x.png` (152x152)
- `icon-83.5@2x.png` (167x167)
- `icon-1024.png` (1024x1024)

## 🔧 Alternative: Sử dụng MakeAppIcon
1. Vào: https://makeappicon.com/
2. Upload icon gốc
3. Chọn iOS
4. Download và copy vào thư mục

## 🚀 Sau khi tạo icon đúng
1. Commit và push changes
2. GitHub Actions sẽ build thành công
3. Không còn lỗi dimensions

## 📝 Ghi chú
- Icon hiện tại là placeholder
- Cần thay thế bằng icon đúng kích thước
- Online tools sẽ tạo đúng kích thước tự động
