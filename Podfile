# Uncomment the next line to define a global platform for your project

platform :ios, '14.1'

target 'FantasyTwitter (iOS)' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FantasyTwitter (iOS)


pod 'UMCommon'
pod 'UMDevice'
pod 'UMCCommonLog'

pod 'SDWebImageSwiftUI'
pod 'lottie-ios'
pod 'CropViewController'

pod 'FantasyUI', :path => './FantasyUI'
pod 'Swifter', :path => './Swifter'

end


post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end