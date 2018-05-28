Pod::Spec.new do |s|
  s.name         = "HSFKit"
  s.version      = "1.2.6"
  s.ios.deployment_target = '8.0'
  s.summary      = "这是一个帮助你迅速搭建项目框架的库"
  s.homepage     = "https://github.com/HSFAqi/HSFKit"
  s.social_media_url = 'https://www.baidu.com'
  #s.license      = "MIT"
  s.license    = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "hsf" => "huangsf_ios@sina.com" }
  s.source       = { :git => 'https://github.com/HSFAqi/HSFKit.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'HSFKit/HSFBase/*.{h,m}' , 'HSFKit/HSFConfig/*.{h,m}' , 'HSFKit/HSFCategory/*.{h,m}'
  s.public_header_files = 'HSFKit/HSFBase/*.h' , 'HSFKit/HSFConfig/*.h' , 'HSFKit/HSFCategory/*.h'

  s.dependency "XHToast"
  s.dependency "SVProgressHUD" 
  s.frameworks = 'UIKit' , 'Foundation'







end
