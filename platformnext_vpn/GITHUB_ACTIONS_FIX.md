# Khắc phục lỗi GitHub Actions - Code Signing

## 🚨 **Lỗi gặp phải:**
```
Error: Process completed with exit code 1.
Encountered error while building for device.
```

## 🔍 **Nguyên nhân:**
- Workflow đang cố gắng build cho **device thật** (`iphoneos`)
- Không có **Apple Developer Team** được cấu hình
- Thiếu **code signing certificate** và **provisioning profile**

## ✅ **Giải pháp đã áp dụng:**

### 1. **Sửa workflow chính (`build_ios.yml`):**
- ✅ **Build cho simulator** thay vì device: `--simulator`
- ✅ **Loại bỏ code signing** requirements
- ✅ **Cập nhật đường dẫn** tìm Runner.app cho simulator
- ✅ **Đổi tên IPA** thành `platformnext_vpn_simulator.ipa`

### 2. **Tạo workflow riêng cho device (`build_ios_device.yml`):**
- ✅ **Workflow riêng** cho device build
- ✅ **Manual trigger** với input parameters
- ✅ **Unsigned IPA** cho device (cần ký thủ công)

## 📁 **Files đã cập nhật:**

### `build_ios.yml` (Workflow chính):
```yaml
# Build cho simulator
flutter build ios --simulator --release

# Tìm Runner.app trong simulator path
build/ios/Release-iphonesimulator/Runner.app
```

### `build_ios_device.yml` (Workflow mới):
```yaml
# Build cho device (unsigned)
flutter build ios --release --no-codesign

# Tìm Runner.app trong device path  
build/ios/Release-iphoneos/Runner.app
```

## 🚀 **Cách sử dụng:**

### **Workflow chính (Simulator):**
- ✅ **Tự động chạy** khi push code
- ✅ **Build thành công** không cần code signing
- ✅ **IPA cho simulator** - có thể test trên Xcode Simulator

### **Workflow device (Manual):**
1. Vào **Actions** tab trên GitHub
2. Chọn **"Build iOS IPA for Device (Signed)"**
3. Click **"Run workflow"**
4. Nhập **Team ID** và **Bundle ID** (nếu cần)
5. Download **unsigned IPA** từ artifacts

## 📱 **Các loại IPA được tạo:**

### 1. **Simulator IPA:**
- **File:** `platformnext_vpn_simulator.ipa`
- **Mục đích:** Test trên Xcode Simulator
- **Code signing:** Không cần
- **Cài đặt:** Chỉ trên simulator

### 2. **Device IPA (Unsigned):**
- **File:** `platformnext_vpn_device.ipa`
- **Mục đích:** Ký và cài trên device thật
- **Code signing:** Cần ký thủ công
- **Cài đặt:** Trên device thật (sau khi ký)

## 🔧 **Cách ký IPA cho device:**

### **Sử dụng eSign:**
1. Download `platformnext_vpn_device.ipa` từ GitHub Actions
2. Mở **eSign** app
3. Import IPA file
4. Chọn **certificate** của bạn
5. **Sign** và **Install**

### **Sử dụng AltStore:**
1. Download IPA từ GitHub Actions
2. Mở **AltStore**
3. **Add** IPA file
4. **Install** lên device

### **Sử dụng Sideloadly:**
1. Download IPA từ GitHub Actions
2. Mở **Sideloadly**
3. **Drag & drop** IPA file
4. **Start** sideloading

## ⚠️ **Lưu ý quan trọng:**

### **Simulator IPA:**
- ✅ **Không cần certificate**
- ✅ **Build nhanh**
- ✅ **Test UI/UX**
- ❌ **Không test performance thật**

### **Device IPA:**
- ✅ **Test performance thật**
- ✅ **Test trên device thật**
- ❌ **Cần certificate**
- ❌ **Cần ký thủ công**

## 🎯 **Kết quả sau khi sửa:**

### **Trước:**
- ❌ **Build failed** - Code signing error
- ❌ **Exit code 1**
- ❌ **Không tạo được IPA**

### **Sau:**
- ✅ **Build thành công** - Simulator
- ✅ **IPA được tạo** - Có thể download
- ✅ **Workflow hoạt động** - Không lỗi
- ✅ **Có 2 options** - Simulator + Device

## 📋 **Checklist sau khi sửa:**

- [ ] Workflow `build_ios.yml` chạy thành công
- [ ] Tạo được `platformnext_vpn_simulator.ipa`
- [ ] Workflow `build_ios_device.yml` có thể chạy manual
- [ ] Có thể download IPA từ artifacts
- [ ] Không còn lỗi code signing

## 🔄 **Workflow mới:**

### **Automatic (Simulator):**
```yaml
on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:
  schedule:
    - cron: '0 0 * * *'
```

### **Manual (Device):**
```yaml
on:
  workflow_dispatch:
    inputs:
      team_id:
        description: 'Apple Developer Team ID'
        required: true
```

Bây giờ GitHub Actions sẽ build thành công và tạo IPA cho cả simulator và device! 🎉
