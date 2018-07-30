# GoogleAdsDemo

## This demo project helps in integrating GoogleMobileAds framework into Swift project. GoogleAdsView.swift file all you need to add to your project to get started.

Add GoogleMobileAds framework to your project by following steps mentioned in the admob site:

https://developers.google.com/admob/ios/quick-start

CocoaPods - Add the below line to the project's pod file:
pod 'Google-Mobile-Ads-SDK'
Then perform the below command in the terminal 
pod install

Manual installation: download the framework and import it into project.
https://developers.google.com/admob/ios/download

Add GoogleAdView.swift file into your project. Now we have two ways to implement:
1. Taking the banner view in ViewController in storyboard and connect the outlet in vc.swift file.

```objc
@IBOutlet weak var bannerView: GoogleAdView!
override func viewDidLoad() {
    //Do the initial set up for Banner ads
    bannerView.initializeBannerView(viewController: self)
}
 ```

2. Take the banner view property in viewController.swift and intialize it.

```objc
//This instance will display the banner in the UI
var bannerView: GoogleAdView = GoogleAdView()
override func viewDidLoad() {
    addBannerViewToView()
}

func addBannerViewToView() {
    // Set the frame for BannerView
    bannerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
    // Add banner view to the main UI
    view.addSubview(bannerView)
    // Do the initial set up for banner ads
    bannerView.initializeBannerView(viewController: self)
}
