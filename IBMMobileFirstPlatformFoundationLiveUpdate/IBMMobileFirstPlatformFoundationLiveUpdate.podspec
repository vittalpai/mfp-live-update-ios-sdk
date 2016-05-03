Pod::Spec.new do |s|
  s.name             = "IBMMobileFirstPlatformFoundationLiveUpdate"
  s.version          = '8.0.0'
  s.license          = "IBM - MobileFirst Platform Foundation 8.0 beta license agreement"
  s.author           = { "LiveUpdate service for IBM MobileFirst platform" => "ishaib@il.ibm.com" }
  s.summary          = "LiveUpdate service for IBM MobileFirst Platform Foundation"
  s.description      = "Contains LiveUpdate service for IBM MobileFirst Platform Foundation"
  s.homepage         = "http://ibm.com"
  s.source           = {:git => 'git@github.ibm.com:MobileFirst/mfp-live-update-ios-sdk.git'}
  s.platform         = :ios, "8.0"
  s.dependency 'IBMMobileFirstPlatformFoundation','~> 8.0'
  s.source_files = "IBMMobileFirstPlatformFoundationLiveUpdate/**/*.{swift}"
end