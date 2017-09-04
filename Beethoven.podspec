Pod::Spec.new do |s|
  s.name             = "Beethoven"
  s.summary          = "A maestro of pitch detection"
  s.version          = "3.0.1"
  s.homepage         = "https://github.com/vadymmarkov/Beethoven"
  s.license          = 'MIT'
  s.author           = { "Vadym Markov" => "markov.vadym@gmail.com" }
  s.source           = {
    :git => "https://github.com/vadymmarkov/Beethoven.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/vadymmarkov'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.12'

  s.requires_arc = true
  s.ios.source_files = 'Source/**/*'
  s.osx.source_files = 'Source/**/*'

  s.frameworks = 'Foundation', 'AVFoundation', 'Accelerate'
  s.dependency 'Pitchy'

end
