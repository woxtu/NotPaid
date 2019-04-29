# NotPaid

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/v/NotPaid.svg?style=flat-square)](https://cocoapods.org/pods/NotPaid)

This is an iOS version of [kleampa/not-paid](https://github.com/kleampa/not-paid).

## Client did not pay?

Add opacity to views and decrease it every day until their app completely fades away. Set a due date and customize the number of days you offer them until the app is fully vanished.

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dueDate = dateFormatter.date(from: "2017-02-27")!

        NotPaid.configure(dueDate: dueDate, daysDeadline: 60)

        window?.backgroundColor = .white

        return true
    }
}
```

## Installation

### Carthage

```
github "woxtu/NotPaid"
```

### CocoaPods

```
pod 'NotPaid'
```

## License

Licensed under the MIT license.
