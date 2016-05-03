Pod::Spec.new do |s|
s.name         = 'IBMMobileFirstPlatformFoundationLiveUpdate'
s.version      = '8.0.0'
s.license      = "IBM - MobileFirst Platform Foundation 8.0 beta license agreement"
s.author       = { "IBM MobileFirst platform for iOS and watchOS." => "mobilsdk@us.ibm.com" }
s.summary      = "LiveUpdate SDK"
s.description  = "Use this SDK to add LiveUpdate features to your IBM MobileFirst platform for iOS"
s.homepage   = "https://mobilefirstplatform.ibmcloud.com/beta/#license"
s.source     = {:git => 'git@github.ibm.com:MobileFirst/mfp-live-update-ios-sdk.git'}


s.platforms = {
:ios => "8.0"
}

s.source_files = "LiveUpdateSDK/**/*.{swift}"

end