# SwiftOverlay

<p align="left">
  <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
  </a>
  <a href="https://travis-ci.com/arturdev/Unrealm">
      <img src="https://travis-ci.com/PahlevanyanSamvel/SwiftOverlay.svg?branch=master" alt="Build Status">
  </a>
  <a href="https://cocoapods.org/pods/Unrealm">
      <img src="https://img.shields.io/cocoapods/v/SwiftOverlay.svg?style=flat" alt="Version">
  </a>
  <a href="https://cocoapods.org/pods/Unrealm">
      <img src="https://img.shields.io/cocoapods/l/SwiftOverlay.svg?style=flat" alt="License">
  </a>
  <a href="https://cocoapods.org/pods/Unrealm">
      <img src="https://img.shields.io/cocoapods/p/SwiftOverlay.svg?style=flat" alt="Platform">
  </a>

</p>


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
