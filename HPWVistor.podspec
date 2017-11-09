
Pod::Spec.new do |s|



s.name         = "HPWVistorSDK1"
s.version      = "2.6.8"
s.summary      = "HPWVistorSDK1"

s.description  = <<-DESC
HPWVistorSDK for 智八哥
DESC

s.homepage     = "http://www.71chat.com"
s.author             = { "Vieene" => "5652903@qq.com" }
s.platform     = :ios, "8.0"


s.source       = { :git => "https://github.com/Kssss/HPWVistor.git", :tag => s.version }

s.source_files  = "HPWVistorSDK1/include/**/*.{h,m}"
s.vendored_libraries = "HPWVistorSDK1/**/*.a"


s.resources =  ['HPWVistorSDK1/Resources/HappyWinBundle.bundle','HPWVistorSDK1/Resources/LYTChatProgressHUD.bundle']

s.libraries = "xml2.2", "z","sqlite3.0"

s.dependency "LYMqttSDK", "~> 0.0.7"

end


