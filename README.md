# MFP Live Update iOS SDK

## Sample usage for the API

### Obtains configuration 

#### By Segment :

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

#### By Params :

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
