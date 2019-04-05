
Pod::Spec.new do |s|
  s.name         = "RNCTabBarIos"
  s.version      = "1.0.0"
  s.summary      = "RNCTabBarIos"
  s.description  = <<-DESC
                  RNCTabBarIos
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "tlta.bkhn@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/TranLuongTuanAnh/react-native-tabbar-ios.git", :tag => "master" }
  s.source_files  = "RNCTabBarIos/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end
