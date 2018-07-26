//
//  MasterViewController.swift
//  GoogleAdsDemo
//
//  Created by Anita Agrawal on 25/07/18.
//  Copyright © 2018 Anita Agrawal. All rights reserved.
//

//Add GoogleMobileAds framework to your project by following steps mentioned in the admob site:
//https://developers.google.com/admob/ios/banner#prerequisites

import UIKit
import GoogleMobileAds

final class GoogleAdView: UIView {
    ///This instance will carry the ads
    private var bannerView: GADBannerView!
    
    func initializeBannerView(withID adUnitID: String = "ca-app-pub-3940256099942544/2934735716", viewController: UIViewController) {
        ///Initialize banner view with Banner size (320x50)
        self.bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        self.bannerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bannerView)
        ///Ad unit IDs are created in the AdMob UI, and represent a place in your app where ads appear. If you show banner ads in two view controllers, for example, you can create an ad unit for each one.
        
        self.bannerView.adUnitID = adUnitID
        self.bannerView.rootViewController = viewController
        
        ///GADRequest objects represent a single ad request, and contain properties for things like targeting information.
        self.bannerView.load(GADRequest())
        ///To register for banner ad events, set the delegate property on GADBannerView to an object that implements the GADBannerViewDelegate protocol. Generally, the class that implements banner ads also acts as the delegate class, in which case, the delegate property can be set to self.
        self.bannerView.delegate = self
    }
}

extension GoogleAdView: GADBannerViewDelegate {
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print(#function)
        // Add banner to view and add constraints as above.
        addBannerViewToView()
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("\(#function): \(error.localizedDescription)")
        bannerView.removeFromSuperview()
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print(#function)
    }
    func addBannerViewToView() {
        ///Setting bannner view frame just before it appears to main UI
        bannerView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: frame.size)
        bannerView.alpha = 0;
        UIView.animate(withDuration: 0.5, animations: {
            self.bannerView.alpha = 1.0
        })
    }
}
