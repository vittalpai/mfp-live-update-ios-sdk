# MFP Live Update iOS SDK
> SDK for the LiveUpdate feature. Let's you build and application with dynmic settings. 

## Sample usage of the API

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
```

#### Disable cache (by default it is enabled):

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
