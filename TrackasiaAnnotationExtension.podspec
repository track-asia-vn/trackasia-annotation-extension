Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "TrackasiaAnnotationExtension"
  s.version      = "1.0.0"

  s.summary      = "Extension to support Trackasia's runtime styling annotations api."
  s.description  = "Provides an object oriented annotation api around runtime styling."

   # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

   s.license = { :type => "ISC", :file => "LICENSE.md" }

   # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.authors      = { 'track-asia' => 'github.com/track-asia' }
  s.homepage     = "https://github.com/track-asia/trackasia-annotation-extension"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "11.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/track-asia/trackasia-annotation-extension.git" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "TrackasiaAnnotationExtension/**/*.{h,m}"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.requires_arc = true
  s.module_name = "TrackasiaAnnotationExtension"
  s.dependency "Trackasia", "~> 1.0.0"

  s.ios.deployment_target = '11.0'

end
