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

### Import

###### Swift

```swift
import YouboraConfigUtils
```

###### Objc

```objectivec
#import <YouboraConfigUtils/YouboraConfigUtils-Swift.h>
```

### Initialize View Controller

###### Swift

```swift
YouboraConfigViewController.initFromXIB()
```

If you wanna an animation when YouboraConfigViewController close you should initialize this way, this flag is only available for iOS, tvOS and macOS don't support it

```swift
YouboraConfigViewController.initFromXIB(animatedNavigation: true)
```

###### Objc

```objectivec
[YouboraConfigViewController initFromXIBWithAnimatedNavigation:true];
```

### Navigation

#### iOS

You can use the UINavigationController to navigate or case there's no UINavigationController you can present it modally, the YouboraConfigViewController will adapt for both cases
###### Swift

```swift
guard let navigationController = self.navigationController else {
  self.present(YouboraConfigViewController.initFromXIB(animatedNavigation: true), animated: true, completion: nil)
  return
}

navigationController.show(YouboraConfigViewController.initFromXIB(), sender: nil)
```

###### Objc
```objectivec
if (self.navigationController) {
    [self.navigationController showViewController:[YouboraConfigViewController initFromXIB] sender:nil];
} else {
    [self presentViewController:[YouboraConfigViewController initFromXIBWithAnimatedNavigation:true] animated:true completion:nil];
}
```

#### tvOS

###### Swift

```swift
guard let navigationController = self.navigationController else {
  self.present(YouboraConfigViewController.initFromXIB(), animated: true, completion: nil)
  return
}

navigationController.show(YouboraConfigViewController.initFromXIB(), sender: nil)
```

###### Objc
```objectivec
if (self.navigationController) {
    [self.navigationController showViewController:[YouboraConfigViewController initFromXIB] sender:nil];
} else {
    [self presentViewController:[YouboraConfigViewController initFromXIB] animated:true completion:nil];
}
```

### Get saved configurations

###### Swift

```swift
YouboraConfigManager.getOptions()
```

###### Objc

```objectivec
[YouboraConfigManager getOptions];
```

## Run samples project

###### Via cocoapods

Navigate to the root folder and then execute: 


```bash
pod install
```

1. Now you have to go to your **target > General > Frameworks, Libraries and Embedded Content** and change the frameworks that you are using in cocoapods from **Embed & Sign** to **Do Not Embed**


###### Via carthage (Default)
Navigate to the root folder and then execute: 
```bash
carthage update
```

For more information you can check the examples in the folder **./Example/iOS** for swift and for obj-c **./Example/iOS-Objc**
