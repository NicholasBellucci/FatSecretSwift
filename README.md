# FatSecretSwift
FatSecretSwift is a Framework built to help connect to the FatSecret REST api. Currently the framework supports ```foods.search``` and ```food.get```.

## Requirements
Xcode 10.x or a Swift 4.2/5.x toolchain with Swift Package Manager.

## Installation

For use with an Xcode project, FatSecretSwift can be added by navigating to `File > Swift Packages > Add Package Dependency...` and adding `https://github.com/NicholasBellucci/FatSecretSwift.git`

Xcode will give a few options when it comes to the rules. Feel free to choose between using the latest release or master as both should align.

FatSecretSwift can also be added through a `Package.swift` file. Just include `.package(url: "https://github.com/NicholasBellucci/FatSecretSwift.git", from: "0.1.0")` as a dependency.


## Usage

First step is to initialize your personal credentials. In the example this is done in the AppDelegate but this can be done wherever so long as it is done before any API request.

``` swift
import FatSecretSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    enum Constants {
        static let apiKey = ""
        static let apiSecret = ""
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FatSecretCredentials.setConsumerKey(Constants.apiKey)
        FatSecretCredentials.setSharedSecret(Constants.apiSecret)

        return true
    }
}
```

Once this has been done requests can be made by initializing the FatSecretClient.

``` Swift
let fatSecretClient = FatSecretClient()
```

### Search

``` Swift
fatSecretClient.searchFood(name: "Hotdog") { search in
    print(search.foods)
}
```

### Get Food

``` Swift
fatSecretClient.getFood(id: "16758") { food in
    print(food)
}
```

## License

SociableWeaver is, and always will be, MIT licensed. See [LICENSE](LICENSE) for details.
