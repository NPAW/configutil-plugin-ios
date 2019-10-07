
Pod::Spec.new do |s|
  s.name         = "YouboraConfigUtils"
  s.version      = "0.0.1"
  
  # Metadata
  s.summary      = "Set and get all available options to be sent to the back-end"
  s.description  = <<-DESC
  The framework contains a ViewController to be inserted in a container. With this view controller, you can set all the properties available
  to be sent to the back-end. This framework also saves in user defaults the modified values and get values to be used whenever the user wants.    
                   DESC
  s.homepage     = "http://developer.nicepeopleatwork.com/"

  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  s.author       = { "Nice People at Work" => "support@nicepeopleatwork.com" }

  s.dependency 'YouboraLib'
  
  # Platforms
  s.ios.deployment_target = "9.0"
  
  # Swift version
  s.swift_version = "5.0"

  # Source Location
  s.source       = { :git => "https://bitbucket.org/npaw/configutil-plugin-ios.git", :tag => "#{s.version}" }

  # Source files
  s.source_files  = "YouboraConfigUtils/**/*.{swift,h,m}"
  s.public_header_files = "YouboraConfigUtils/**/*.h"

  # Project settings
  s.requires_arc = true
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) YOUBORALIB_VERSION=' + s.version.to_s }
end