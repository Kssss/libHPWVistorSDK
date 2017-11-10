
Pod::Spec.new do |s|



s.name         = "HPWVistor"
s.version      = "2.6.9"
s.summary      = "HPWVistor for 智八哥"

s.description  = <<-DESC
    HPWVistorSDK for 智八哥访客端
                    DESC

s.homepage     = "http://www.71chat.com"
s.author             = { "71chat" => "www.71chat.com" }
s.platform     = :ios, "8.0"

s.source       = { :git => "https://github.com/Kssss/libHPWVistorSDK.git", :tag => s.version }

s.source_files  = "HPWSDK/include/**/*.{h,m}"
s.vendored_libraries = "HPWSDK/**/*.a"


s.resources =  ['HPWSDK/Resources/HappyWinBundle.bundle','HPWSDK/Resources/LYTChatProgressHUD.bundle']

s.libraries = "xml2.2", "z","sqlite3.0"

#s.ios.vendored_libraries = '/libSocket.a'

s.dependency "LYMqttSDK", "~> 0.0.7"

end


