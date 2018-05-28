Pod::Spec.new do |s|
  s.name         = "HSFKit"
  s.version      = "1.2.2"
  s.ios.deployment_target = '8.0'
  s.summary      = "这是一个帮助你迅速搭建项目框架的库"
  s.homepage     = "https://github.com/HSFAqi/HSFKit"
  s.social_media_url = 'https://www.baidu.com'
  #s.license      = "MIT"
  s.license    = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "hsf" => "huangsf_ios@sina.com" }
  s.source       = { :git => 'https://github.com/HSFAqi/HSFKit.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'HSFKit/HSFKit.h'
  s.public_header_files = 'HSFKit/HSFKit.h'

#---------subspec------------

  s.subspec 'HSFCategory' do |hsfcategory|
    hsfcategory.source_files = 'HSFKit/HSFCategory/HSFCategory.h'
    hsfcategory.public_header_files = 'HSFKit/HSFCategory/HSFCategory.h'

      hsfcategory.subspec 'NSFoundation' do |nsfoundation|
      nsfoundation.source_files = 'HSFKit/HSFCategory/NSFoundation/HSFNSFoundation.h'
      nsfoundation.public_header_files = 'HSFKit/HSFCategory/NSFoundation/HSFNSFoundation.h'
 
	nsfoundation.subspec 'NSString' do |nsstring|
        nsstring.source_files = 'HSFKit/HSFCategory/NSFoundation/NSString/*.{h,m}'
        nsstring.public_header_files = 'HSFKit/HSFCategory/NSFoundation/NSString/*.h'
	nsstring.frameworks = 'UIKit' , 'Foundation'
        end

      end

      hsfcategory.subspec 'UIKit' do |uikit|
      uikit.source_files = 'HSFKit/HSFCategory/UIKit/HSFUIKit.h'
      uikit.public_header_files = 'HSFKit/HSFCategory/UIKit/HSFUIKit.h'

        uikit.subspec 'UIButton' do |uibutton|
        uibutton.source_files = 'HSFKit/HSFCategory/UIKit/UIButton/*.{h,m}'
        uibutton.public_header_files = 'HSFKit/HSFCategory/UIKit/UIButton/*.h'
        uibutton.frameworks = 'UIKit' , 'Foundation'
	end

        uikit.subspec 'UIControl' do |uicontrol|
        uicontrol.source_files = 'HSFKit/HSFCategory/UIKit/UIControl/*.{h,m}'
        uicontrol.public_header_files = 'HSFKit/HSFCategory/UIKit/UIControl/*.h'
        uicontrol.frameworks = 'UIKit' , 'Foundation'
	end

        uikit.subspec 'UIImage' do |uiimage|
        uiimage.source_files = 'HSFKit/HSFCategory/UIKit/UIImage/*.{h,m}'
        uiimage.public_header_files = 'HSFKit/HSFCategory/UIKit/UIImage/*.h'
        uiimage.frameworks = 'UIKit' , 'Foundation'
	end

        uikit.subspec 'UINavigationController' do |uinavigationcontroller|
        uinavigationcontroller.source_files = 'HSFKit/HSFCategory/UIKit/UINavigationController/*.{h,m}'
        uinavigationcontroller.public_header_files = 'HSFKit/HSFCategory/UIKit/UINavigationController/*.h'
	uinavigationcontroller.frameworks = 'UIKit' , 'Foundation'        
	end

        uikit.subspec 'UIView' do |uiview|
        uiview.source_files = 'HSFKit/HSFCategory/UIKit/UIView/*.{h,m}'
        uiview.public_header_files = 'HSFKit/HSFCategory/UIKit/UIView/*.h'
        uiview.frameworks = 'UIKit' , 'Foundation'
	end
      end
  end

  s.subspec 'HSFConfig' do |hsfconfig|
    hsfconfig.source_files = 'HSFKit/HSFConfig/*.{h,m}'
    hsfconfig.public_header_files = 'HSFKit/HSFConfig/HSFConfig.h'
  end

  s.subspec 'HSFBase' do |hsfbase|
    hsfbase.source_files = 'HSFKit/HSFBase/*.{h,m}'
    hsfbase.public_header_files = 'HSFKit/HSFBase/HSFBase.h'
    s.dependency "XHToast"
    s.dependency "SVProgressHUD"
    s.dependency "HSFKit/HSFConfig"
  end


  s.dependency "XHToast"
  s.dependency "SVProgressHUD" 
  s.frameworks = 'UIKit' , 'Foundation'







end
