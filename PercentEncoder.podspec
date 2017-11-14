Pod::Spec.new do |s|
  s.name = 'PercentEncoder'
  s.version = '1.2.1'
  s.license = 'MIT'
  s.summary = 'PercentEncoder is a lightweight library to escape string using so called URL encoding in Swift'
  s.homepage = 'https://github.com/tasanobu/PercentEncoder'
  s.social_media_url = 'http://twitter.com/tasanobu'
  s.authors = { 'Kazunobu Tasaka' => 'tasanobu@gmail.com' }
  s.source = { :git => 'https://github.com/tasanobu/PercentEncoder.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'PercentEncoder/*.swift'
  s.requires_arc = true
end
