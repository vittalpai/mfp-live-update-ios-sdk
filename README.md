# MFP LiveUpdate iOS SDK

### Install Using CocaPods
```cocapods
use_frameworks!

source "git@github.ibm.com:MobileFirst/mfp-live-update-cocapods-specs.git"
source "git@github.ibm.com:nostanle/imf-client-sdk-specs-inhouse.git"

target 'TestLiveUpdate' do
    pod 'IBMMobileFirstPlatformFoundationLiveUpdate'
end
```

### Sample usages of the API

#### Obtain Configuration By Segment :

```Swift
LiveUpdateManager.sharedInstance.obtainConfiguration("segment1", completionHandler: { (configuration, error) in
  if error == nil {
    print (configuration?.getProperty("property1"))
    print (configuration?.isFeatureEnabled("feature1"))
  } else {
    print (error)
  }
})
```

#### Obtain Configuration By Params :

```Swift
LiveUpdateManager.sharedInstance.obtainConfiguration(["paramKey":"paramValue"], completionHandler: { (configuration, error) in
  if error == nil {
    print (configuration?.getProperty("property1"))
    print (configuration?.isFeatureEnabled("feature1"))
  } else {
    print (error)
  }
})
```


#### Disable cache (by default the cache is enabled):

```Swift
LiveUpdateManager.sharedInstance.obtainConfiguration("segment1", useCache: false, completionHandler: { (configuration, error) in
  if error == nil {
    print (configuration?.getProperty("property1"))
    print (configuration?.isFeatureEnabled("feature1"))
  } else {
    print (error)
  }
})
```

## License
IBM
