
Pod::Spec.new do |s|
  s.name         = "YouboraConfigUtils"
  s.version = '1.1.0'
  
  # Metadata
  s.summary      = "Set and get all available options to be sent to the back-end"
  s.description  = <<-DESC
  The framework contains a ViewController to be inserted in a container. With this view controller, you can set all the properties available
  to be sent to the back-end. This framework also saves in user defaults the modified values and get values to be used whenever the user wants.    
                   DESC
  s.homepage     = "http://developer.nicepeopleatwork.com/"

  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  s.author       = { "Nice People at Work" => "support@nicepeopleatwork.com" }

  s.dependency 'YouboraLib', '6.5.8'
  
  # Platforms
  s.ios.deployment_target = "9.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"

  # Swift version
  s.swift_version = "4.0", "4.1", "4.2", "4.3", "5.0", "5.1"

  # Source Location
  s.source       = { :git => "https://bitbucket.org/npaw/configutil-plugin-ios.git", :tag => "#{s.version}" }

  # Source files
  s.ios.source_files  = "YouboraConfigUtils/YouboraConfigUtils iOS/**/*.{swift,h,m}","YouboraConfigUtils/YouboraConfigUtils shared/**/*.{swift,h,m}"
  s.ios.public_header_files = "YouboraConfigUtils/YouboraConfigUtils iOS/**/*.h"
  s.ios.resources = "YouboraConfigUtils/YouboraConfigUtils iOS/**/*.{xib}"

  s.tvos.source_files = "YouboraConfigUtils/YouboraConfigUtils tvOS/**/*.{swift,h,m}","YouboraConfigUtils/YouboraConfigUtils shared/**/*.{swift,h,m}"
  s.tvos.public_header_files = "YouboraConfigUtils/YouboraConfigUtils tvOS/**/*.{h}"
  s.tvos.resources = "YouboraConfigUtils/YouboraConfigUtils tvOS/**/*.{xib}"

  s.osx.source_files = "YouboraConfigUtils/YouboraConfigUtils macOS/**/*.{swift,h,m}","YouboraConfigUtils/YouboraConfigUtils shared/**/*.{swift,h,m}"
  s.osx.public_header_files = "YouboraConfigUtils/YouboraConfigUtils macOS/**/*.{h}"
  s.osx.resources = "YouboraConfigUtils/YouboraConfigUtils macOS/**/*.{xib}"
  s.osx.exclude_files = "YouboraConfigUtils/YouboraConfigUtils Shared/Utils & Helper & Extensions/Extensions/UIView.swift", "YouboraConfigUtils/YouboraConfigUtils Shared/Utils & Helper & Extensions/Extensions/UIViewController.swift"
end
