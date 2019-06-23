# SwiftOverlay

[![CI Status](https://img.shields.io/travis/PahlevanyanSamvel/SwiftOverlay.svg?style=flat)](https://travis-ci.org/PahlevanyanSamvel/SwiftOverlay)
[![Version](https://img.shields.io/cocoapods/v/SwiftOverlay.svg?style=flat)](https://cocoapods.org/pods/SwiftOverlay)
[![License](https://img.shields.io/cocoapods/l/SwiftOverlay.svg?style=flat)](https://cocoapods.org/pods/SwiftOverlay)
[![Platform](https://img.shields.io/cocoapods/p/SwiftOverlay.svg?style=flat)](https://cocoapods.org/pods/SwiftOverlay)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftOverlay is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftOverlay'
```
## Usage
```swift
class UsersOverlay: OverlayVC  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
```
## Config
```swift
class UsersOverlay: OverlayVC  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.containerView = tableContentView // Required
        self.scrollView = tableView // Optional
        self.setupPanView(pan: getPanView()) // Optional
        //
    }
}
```

## Usage scenario
![](https://github.com/PahlevanyanSamvel/SwiftOverlay/blob/master/Resource/example.gif)



## Author

Pahlevanyan Samvel, pahlevanyansamvel@gmail.com

## License

SwiftOverlay is available under the MIT license. See the LICENSE file for more info.
