platform :ios, '11.0'

def shared_pods
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Trackasia', :git => 'https://github.com/track-asia/trackasia-cocoapods.git', :tag => '1.0.1'
end

target 'TrackasiaAnnotationExtension' do
  shared_pods

  target 'TrackasiaAnnotationExtensionTests' do

  end

end

target 'annotationapp' do
  shared_pods
end
