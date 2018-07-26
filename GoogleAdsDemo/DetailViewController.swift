//
//  DetailViewController.swift
//  GoogleAdsDemo
//
//  Created by Anita Agrawal on 25/07/18.
//  Copyright © 2018 Anita Agrawal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    //This instance will display the banner in the UI
    var bannerView: GoogleAdView = GoogleAdView()

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        addBannerViewToView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    func addBannerViewToView() {
        // Set the frame for BannerView
        bannerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        // Add banner view to the main UI
        view.addSubview(bannerView)
        // Do the initial set up for banner ads
        bannerView.initializeBannerView(viewController: self)
    }

}

