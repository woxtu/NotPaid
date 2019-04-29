Pod::Spec.new do |spec|
  spec.name          = 'NotPaid'
  spec.version       = '1.0.1'
  spec.license       = { :type => 'MIT', :file => 'LICENSE-MIT' }
  spec.homepage      = 'https://github.com/woxtu/NotPaid'
  spec.author        = { 'woxtu' => 'woxtup@gmail.com' }
  spec.summary       = 'Add opacity to views and decrease it every day until their app completely fades away.'
  spec.source        = { :git => 'https://github.com/woxtu/NotPaid.git', :tag => spec.version }
  spec.swift_version = '5.0'

  spec.ios.deployment_target  = '8.0'

  spec.source_files       = 'Sources/**/*.swift'

  spec.ios.framework  = 'UIKit'
end
