#
# Be sure to run `pod lib lint TopStepSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TopStepSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TopStepSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/htangsmart/TopStepSDK-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'topstep' => 'xinshangguan@topstep-tech.com' }
  s.source           = { :git => 'https://github.com/htangsmart/TopStepSDK-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

#  s.source_files = 'TopStepSDK/Classes/**/*'
  
  #s.static_framework = true
  
  s.frameworks  = 'Foundation', 'UIKit', 'CoreBluetooth'
  #设置 podspec 的默认 subspec
  s.default_subspec = 'core'
  s.requires_arc = true
    #主要 subspec
  s.subspec 'core' do |sp|
    sp.source_files  = "TopStepSDK/Classes/*.{h,m}"
    sp.public_header_files = "TopStepSDK/Classes/*.h"
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/TopStepComKit/TopStepComKit.framework'
    sp.pod_target_xcconfig = {
        'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'x86_64',
        'VALID_ARCHS' => 'arm64',
    }
  end
  
  s.subspec 'persimwear' do |sp|
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/persimwearSDK/persimwearSDK.framework'
    sp.dependency 'TopStepSDK/core'
    sp.libraries = 'c++', 'z', 'sqlite3', 'bz2.1.0'
  end
  
  s.subspec 'proxy' do |sp|
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/TopStepComKitProxy/TopStepComKitProxy.framework'
    sp.dependency 'TopStepSDK/core'
  end

  s.subspec 'flywear' do |sp|
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/flywearsdk/flywearsdk.framework'
    sp.dependency 'TopStepSDK/core'
  end
  
  s.subspec 'sj' do |sp|
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/TopStepComKitSJ/TopStepComKitSJ.framework'
    sp.dependency 'TopStepSDK/core'
  end
  
  s.subspec 'fw' do |sp|
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/TopStepComKitFw/TopStepComKitFw.framework'
    sp.dependency 'TopStepSDK/flywear'
  end
  s.subspec 'fitcloud' do |sp|
    sp.vendored_frameworks = 'TopStepSDK/Frameworks/TopStepComKitFitCloud/TopStepComKitFitCloud.framework'
    sp.dependency 'TopStepSDK/core'
#    sp.xcconfig = {
#        'GCC_PREPROCESSOR_DEFINITIONS' => 'TopStepSDK_Platform_fitcloud=1',
#    }
#    sp.pod_target_xcconfig = {
#        'GCC_PREPROCESSOR_DEFINITIONS' => 'TopStepSDK_Platform_fitcloud=1'
#    }
  end

end
