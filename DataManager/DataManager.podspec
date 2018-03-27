Pod::Spec.new do |s|

  s.name         = "DataManager"
  s.version      = "1.0.0"
  s.summary      = "DataManager is a pod to manage the data access"
  s.description  = "DataManager is a pod to manage the data access"
  s.author       = { "Diego Chohfi" => "dchohfi@gmail.com" }
  s.platform     = :ios
  s.homepage     = "https://github.com/dchohfi/spacex"
  s.source       = { :git => "https://github.com/dchohfi/spacex.git", :tag => "#{s.version}" }

  s.source_files  = ["DataManager/Classes/**/*.{h,m,swift}"]

  s.dependency 'Moya'
  s.dependency 'RxSwift'
  s.dependency 'SwiftResolver'
  
end
