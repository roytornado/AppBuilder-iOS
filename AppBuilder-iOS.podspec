Pod::Spec.new do |s|
  s.name         = "AppBuilder-iOS"
  s.version      = "1.2.2"
  s.summary      = "AppBuilder-iOS"
  s.homepage     = "https://github.com/roytornado/AppBuilder-iOS"
  s.license      = { :type => 'Custom', :text => 'Copyright (C) Royal Next. All Rights Reserved.' }
  s.author       = { "Roy Ng" => "roytornado@gmail.com" }
  s.source       = { :git => "https://github.com/roytornado/AppBuilder-iOS.git", :tag => "#{s.version}" }

  s.platform     = :ios, '6.0'
  s.source_files = 'Lib/**/*.{h,m}'
  s.framework    = 'QuartzCore'
  s.resources    = 'Lib/Res/**'

  s.requires_arc = true
end
