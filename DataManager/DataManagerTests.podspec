Pod::Spec.new do |s|
  s.name             = 'DataManagerTests'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DataManager.'

  s.description      = <<-DESC
  TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dchohfi/DataManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diego Chohfi' => 'diego.turini@99taxis.com' }
  s.source           = { :git => 'https://github.com/dchohfi/DataManager.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.3'
  s.source_files = 'DataManagerTests/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DataManagerTests' => ['DataManagerTests/Resources/Fixtures/*.json']
  # }

  s.frameworks = "XCTest"

  s.dependency "DataManager"
  s.dependency "Nimble"
  s.dependency "Quick"
end
