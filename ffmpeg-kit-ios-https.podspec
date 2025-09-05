require "json"

Pod::Spec.new do |s|
  s.name         = "ffmpeg-kit-ios-https"
  s.version      = "6.0"
  s.summary      = "FFmpeg Kit iOS Https Shared Framework"
  s.description  = "Includes FFmpeg with gmp and gnutls libraries enabled."
  s.license      = { :type => "LGPL-3.0", :file => "ffmpeg-kit-ios-https/ffmpegkit.xcframework/ios-arm64/ffmpegkit.framework/LICENSE" }
  s.homepage     = "https://example.com"
  s.authors      = { "anonymous" => "anon@example.com" }

  s.platform          = :ios
  s.ios.deployment_target = "12.1"
  s.requires_arc      = true
  s.static_framework  = true

  s.source = { :http => "https://github.com/package-dev/ffmpeg-kit-ios-https/releases/download/6.0/framework.zip" }

  s.libraries = ["z", "bz2", "c++", "iconv"]
  s.frameworks = ["AudioToolbox", "AVFoundation", "CoreMedia", "VideoToolbox"]
  
  s.vendored_frameworks = [
    "ffmpeg-kit-ios-https/ffmpegkit.xcframework",
    "ffmpeg-kit-ios-https/libavcodec.xcframework",
    "ffmpeg-kit-ios-https/libavdevice.xcframework",
    "ffmpeg-kit-ios-https/libavfilter.xcframework",
    "ffmpeg-kit-ios-https/libavformat.xcframework",
    "ffmpeg-kit-ios-https/libavutil.xcframework",
    "ffmpeg-kit-ios-https/libswresample.xcframework",
    "ffmpeg-kit-ios-https/libswscale.xcframework",
  ]
end
