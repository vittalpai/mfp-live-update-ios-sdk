Pod::Spec.new do |s|
s.name         = 'LiveUpdateSDK'
s.version      = '8.0.0'
s.license      = "IBM - MobileFirst Platform Foundation 8.0 beta license agreement"
s.author       = { "IBM MobileFirst platform for iOS and watchOS." => "mobilsdk@us.ibm.com" }
s.summary      = "Use this SDK to add LiveUpdate features to your IBM MobileFirst platform for iOS."
s.description  = "LiveUpdate SDK"
s.homepage   = "https://developer.ibm.com/mobilefirstplatform/beta/license"
s.source     = {:git => 'https://github.ibm.com/MobileFirst/mfp-live-update-ios-sdk.git'}


s.platforms = {
:ios => "8.0"
}

s.source_files = "LiveUpdateSDK/**/*.{swift}"

end