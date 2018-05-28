Pod::Spec.new do |s|
  s.name         = "HSFKit"
  s.version      = "1.3.0"
  s.ios.deployment_target = '8.0'
  s.summary      = "这是一个帮助你迅速搭建项目框架的库"
  s.homepage     = "https://github.com/HSFAqi/HSFKit"
  s.social_media_url = 'https://www.baidu.com'
  s.license    = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "hsf" => "huangsf_ios@sina.com" }
  s.source       = { :git => 'https://github.com/HSFAqi/HSFKit.git', :tag => s.version}
  s.requires_arc = true


  #s.source_files = 'HSFKit/HSFBase/*.{h,m}' , 'HSFKit/HSFConfig/*.{h,m}' , 'HSFKit/HSFCategory/*.{h,m}'
  #s.public_header_files = 'HSFKit/HSFBase/*.h' , 'HSFKit/HSFConfig/*.h' , 'HSFKit/HSFCategory/*.h'
  #s.dependency "XHToast"
  #s.dependency "SVProgressHUD"

  s.source_files = 'HSFKit/HSFKitHeader.h'
  s.public_header_files = 'HSFKit/HSFKitHeader.h'


  s.subspec 'HSFConfig' do |hsfconfig|
    hsfconfig.source_files = 'HSFKit/HSFConfig/*.{h,m}'
    hsfconfig.public_header_files = 'HSFKit/HSFConfig/*.h'
  end

  s.subspec 'HSFBase' do |hsfbase|
    hsfbase.source_files = 'HSFKit/HSFBase/*.{h,m}'
    hsfbase.public_header_files = 'HSFKit/HSFBase/*.h'
    hsfbase.dependency "XHToast"
    hsfbase.dependency "SVProgressHUD"
    hsfbase.dependency "HSFKit/HSFConfig"
  end

  s.subspec 'HSFCategory' do |hsfcartegory|
    hsfcartegory.source_files = 'HSFKit/HSFCategory/*.{h,m}'
    hsfcartegory.public_header_files = 'HSFKit/HSFCategory/*.h'
  end 


  s.frameworks = 'UIKit' , 'Foundation'







end
