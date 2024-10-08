Pod::Spec.new do |s|
  s.name         = 'TopStepComKitSJ'
  s.summary      = 'TopStepComKitSJ module, M1 and above support xcode framworks.'
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
  #s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  
  s.libraries        = 'c++', 'z', 'sqlite3', 'bz2.1.0'
  s.frameworks       = 'Foundation', 'UIKit', 'CoreBluetooth'

  s.requires_arc = true
  
  # 先本地加载相关库，等库都上传git后在改为dependency引用
  s.vendored_frameworks = 'Products/TopStepComKitSJ.framework', 'sj/h264encoder.framework', 'sj/SJWatchLib.framework', 'sj/UNIWatchMate.framework', '../TopStepComKit/Products/TopStepComKit.framework', '../TopStepComKitProxy/Products/TopStepComKitProxy.framework'

  s.dependency "ReactiveObjC"
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'PromiseKit'
  s.dependency 'HandyJSON'
  s.dependency 'SwiftyJSON'
  s.dependency 'SWCompression/TAR'
  s.dependency 'BitByteData'
  
end

