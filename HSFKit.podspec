Pod::Spec.new do |s|
  s.name         = "HSFKit"
  s.version      = "1.0.1"
  s.ios.deployment_target = '8.0'
  s.summary      = "简介"
  s.homepage     = "https://github.com/HSFAqi/HSFKit"
  s.social_media_url = 'https://www.baidu.com'
  #s.license      = "MIT"
  s.license    = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "hsf" => "huangsf_ios@sina.com" }
  s.source       = { :git => 'https://github.com/HSFAqi/HSFKit.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'HSFSingleton/*'
  #s.public_header_files = 'runtime/TFRuntimeManager.h'
 
end
