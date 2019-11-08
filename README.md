# YouboraConfigUtils

A framework that generates a view controller to set all the available parameters in Yourbora.

# Installation

#### CocoaPods

Insert into your Podfile

```bash
pod 'YouboraConfigUtils'
```

and then run

```bash
pod install
```

#### Carthage

Insert into your Cartfile

```bash
git "https://bitbucket.org/npaw/configutil-plugin-ios.git"
```

and then run

```bash
carthage update
```

when update complete goes to **{YOUR_SCHEME} > Build Settings > Framework Search Paths** and add **\$(PROJECT_DIR)/Carthage/Build/{iOS, Mac, tvOS or the platform of your scheme}**

# How to use

### Swift

###### Import

```swift
import YouboraConfigUtils
```

###### Initialize View Controller

```swift
YouboraConfigViewController.initFromXIB()
```

###### Get saved configurations

```swift
YouboraConfigManager.getOptions()
```

### Obj-c

###### Import

```objectivec
#import <YouboraConfigUtils/YouboraConfigUtils-Swift.h>
```

###### Initialize View Controller

```objectivec
[YouboraConfigViewController initFromXIB];
```

###### Get saved configurations

```objectivec
[YouboraConfigManager getOptions];
```

For more information you can check the examples in the folder **./Example/iOS** for swift and for obj-c **./Example/iOS-Objc**
