# ffmpeg-kit-ios-https

An iOS wrapper around FFmpeg Kit with HTTPS support. This project helps you integrate FFmpeg into iOS apps quickly with configurations suitable for HTTPS-based transfers and streaming.

## Features

- Integrates FFmpeg Kit for iOS
- HTTPS support for downloading/streaming content
- Distributed via CocoaPods (podspec included)

## Requirements

- Xcode 14 or later
- iOS 12.0 or later
- CocoaPods 1.11+ (1.12+ recommended)

## Installation (CocoaPods)

1. Install CocoaPods if you haven't already:

```bash
sudo gem install cocoapods
```

2. Add the pod to your project's `Podfile`:

```ruby
platform :ios, '12.0'
use_frameworks!

target 'YourAppTarget' do
  pod 'ffmpeg-kit-ios-https',
    :git => 'https://github.com/package-dev/ffmpeg-kit-ios-https.git',
    :tag => '6.0'
end
```

3. Install pods:

```bash
pod install
```

4. Open the generated workspace and build the project:

```bash
xed .
```

## Basic Usage

Example of running an FFmpeg command with FFmpegKit (Swift):

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

Note: Configure App Transport Security (ATS) as needed if you access HTTPS endpoints with self-signed or custom certificates.

## Development

- Update `ffmpeg-kit-ios-https.podspec` when changing version, source, or dependencies.
- Test integration by pointing your app's `Podfile` to this repository.
- Use Git tags for releases (`pod repo push` / `pod trunk push`).

## Contributing

Open an issue or submit a pull request with a clear description of changes.

## License

See the included license file (if any). FFmpeg/FFmpegKit carries its own license terms; ensure compliance when distributing within your application.
