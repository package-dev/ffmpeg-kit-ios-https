# ffmpeg-kit-ios-https

Thư viện iOS đóng gói FFmpeg Kit với hỗ trợ HTTPS. Dự án giúp tích hợp nhanh FFmpeg vào ứng dụng iOS với cấu hình phù hợp cho truyền tải qua HTTPS.

## Tính năng

- Tích hợp FFmpeg Kit cho iOS
- Hỗ trợ HTTPS cho tải/stream nội dung
- Phân phối qua CocoaPods (podspec đi kèm)

## Yêu cầu hệ thống

- Xcode 14 trở lên
- iOS 12.0 trở lên
- CocoaPods 1.11+ (khuyến nghị 1.12+)

## Cài đặt (CocoaPods)

1. Cài đặt CocoaPods nếu chưa có:

```bash
sudo gem install cocoapods
```

2. Thêm vào `Podfile` của dự án iOS của bạn:

```ruby
platform :ios, '12.0'
use_frameworks!

target 'YourAppTarget' do
  pod 'ffmpeg-kit-ios-https', :git => 'https://github.com/<your-org>/ffmpeg-kit-ios-https.git'
  # Hoặc nếu đã phát hành trên Specs:
  # pod 'ffmpeg-kit-ios-https'
end
```

3. Cài đặt pods:

```bash
pod install
```

4. Mở workspace vừa tạo và build dự án:

```bash
xed .
```

## Sử dụng cơ bản

Ví dụ chạy lệnh FFmpeg với FFmpegKit (Swift):

```swift
import FFmpegKit

FFmpegKit.executeAsync("-i https://example.com/video.mp4 -f null -") { session in
    let state = session?.getState()
    let returnCode = session?.getReturnCode()
    print("FFmpegKit state: \(String(describing: state)) returnCode: \(String(describing: returnCode))")
} withLogCallback: { log in
    if let message = log?.getMessage() {
        print("[FFmpeg] \(message)")
    }
} withStatisticsCallback: { statistics in
    if let time = statistics?.getTime() {
        print("[FFmpeg] time=\(time)ms")
    }
}
```

Lưu ý: Cấu hình ATS (App Transport Security) phù hợp nếu truy cập endpoint HTTPS tự ký/chứng chỉ đặc thù.

## Phát triển

- Chỉnh sửa `ffmpeg-kit-ios-https.podspec` khi thay đổi version/source/dependencies.
- Kiểm tra tích hợp bằng cách trỏ `Podfile` của app vào repo này.
- Khuyến nghị dùng Git tags khi phát hành (`pod repo push`/`pod trunk push`).

## Đóng góp

Mở issue hoặc gửi pull request kèm mô tả rõ ràng.

## Giấy phép

Tham khảo tệp giấy phép đi kèm (nếu có). FFmpeg/FFmpegKit có giấy phép riêng; hãy tuân thủ điều khoản tương ứng.
