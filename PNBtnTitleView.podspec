

Pod::Spec.new do |s|

  s.name         = "PNBtnTitleView"
  s.version      = "0.0.1"
  s.summary      = "iOS of PNBtnTitleView."

  

  s.homepage     = "https://github.com/LiuPN/LiuPNCodesRepository"




  s.license      = "Apache"

  s.author             = { "LiuPN" => "panliuliu@139.com" }

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/LiuPN/LiuPNCodesRepository.git", :tag => "0.0.1" }

  s.source_files  = "PNBtnTitleView", "PNBtnTitleView/**/*.{h,m}"
  
  s.frameworks = "Foundation", "UIKit", "XCTest"

  

end
