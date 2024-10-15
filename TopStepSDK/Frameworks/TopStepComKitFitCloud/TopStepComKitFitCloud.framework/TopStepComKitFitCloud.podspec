Pod::Spec.new do |s|
  s.name         = 'TopStepComKitFitCloud'
  s.summary      = 'TopStepComKitFitCloud module, M1 and above support xcode framworks.'
  s.version      = '1.0.2'
  s.description      = <<-DESC
  Private M1 and above support xcode framworks..
  DESC
  s.homepage         = "https://github.com"
  s.license          = 'MIT'
  s.author           = {"rainway" => "864901228@qq.com"}
  s.source           = {:path => "./"}
  s.social_media_url = 'http://www.lessney.com'
  s.platform     = :ios, '12.0'
  s.ios.deployment_target = '12.0'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  
  s.libraries        = 'c++', 'z', 'sqlite3', 'bz2.1.0'
  s.frameworks       = 'Foundation', 'UIKit', 'CoreBluetooth'

  s.requires_arc = true
  s.vendored_frameworks = 'Products/TopStepComKitFitCloud.framework', '../TopStepComKit/Products/TopStepComKit.framework', '../TopStepComKitProxy/Products/TopStepComKitProxy.framework'
  s.resource = 'ft_res/TSBundle.bundle'

  s.dependency 'ReactiveObjC'
  s.dependency 'FitCloudKit'
  s.dependency 'FitCloudDFUKit'
  s.dependency 'FitCloudWFKit'
  s.dependency 'FitCloudNWFKit'
  
end

