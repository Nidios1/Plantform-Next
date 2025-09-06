# Hướng dẫn ký IPA bằng eSign

## 📱 Cách sử dụng eSign để ký IPA

### Bước 1: Tải IPA từ GitHub
1. Vào **Actions** tab trên GitHub
2. Chọn workflow **"Build IPA for eSign"**
3. Chọn run thành công
4. Tải file **"platformnext-vpn-unsigned-ipa"** từ Artifacts

### Bước 2: Cài đặt eSign
1. Tải **eSign** từ App Store hoặc Cydia
2. Mở eSign và cấp quyền cần thiết

### Bước 3: Ký IPA
1. Mở eSign
2. Chọn **"Import IPA"** hoặc **"Add IPA"**
3. Chọn file `platformnext_vpn_unsigned.ipa` đã tải
4. Chọn **"Sign"** hoặc **"Ký"**
5. Chọn **chứng chỉ cá nhân** của bạn
6. Đợi quá trình ký hoàn tất

### Bước 4: Cài đặt IPA đã ký
1. Trong eSign, chọn **"Install"** hoặc **"Cài đặt"**
2. Hoặc export IPA đã ký và cài bằng **AltStore**, **Sideloadly**, etc.

## ⚠️ Lưu ý quan trọng

### Chứng chỉ cá nhân:
- Cần có **Apple Developer Account** (miễn phí hoặc trả phí)
- Tạo **Development Certificate** trong Apple Developer Portal
- Cài đặt certificate vào eSign

### Giới hạn:
- **7 ngày**: IPA ký bằng chứng chỉ miễn phí hết hạn sau 7 ngày
- **3 thiết bị**: Chứng chỉ miễn phí chỉ cài được tối đa 3 thiết bị
- **Cần refresh**: Phải ký lại sau 7 ngày

### Troubleshooting:
- **"Untrusted Enterprise Developer"**: Vào Settings > General > VPN & Device Management > Trust certificate
- **"App cannot be installed"**: Kiểm tra Bundle ID và certificate
- **"Expired certificate"**: Tạo certificate mới

## 🔧 Các công cụ khác

### AltStore:
- Cài đặt qua AltStore (cần máy tính)
- Tự động refresh mỗi 7 ngày

### Sideloadly:
- Cài đặt trực tiếp từ máy tính
- Hỗ trợ nhiều thiết bị

### 3uTools:
- Cài đặt IPA qua USB
- Quản lý thiết bị iOS

## 📞 Hỗ trợ

Nếu gặp vấn đề:
1. Kiểm tra certificate còn hạn không
2. Kiểm tra Bundle ID có đúng không
3. Thử ký lại IPA
4. Kiểm tra thiết bị có đủ dung lượng không
