# FatSecretSwift
FatSecretSwift is a Framework built to help connect to the FatSecret REST api. Currently the framework supports ```foods.search``` and ```food.get```. The demo can be found here: https://github.com/NicholasBellucci/FatSecretSwiftDemo

## Requirements
* iOS 12

## Installation

FatSecretSwift is currently only available by adding it as a submodule to your project.

```git submodule add https://github.com/NicholasBellucci/FatSecretSwift.git```

## Usage

First step is to initialize your personal credentials. In the demo project this is done in the App Delegate but you can do this wherever you want so long as it is done before your API request.

``` Swift

import FatSecretSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    enum Constants {
        static let apiKey = ""
        static let apiSecret = ""
    }

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let credential = FatSecretCredentials()
        credential.setConsumerKey(Constants.apiKey)
        credential.setSharedSecret(Constants.apiSecret)

        return true
    }
}
```

Once this has been done requests can be made by initializing the FatSecretClient.

``` Swift
let fatSecretClient = FatSecretClient()
```

### Models

All Codable structs can be found in the Models folder.

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

## Author

Nicholas Bellucci, nickdbellucci@gmail.com

## License

FatSecretSwift is available under the MIT license.
