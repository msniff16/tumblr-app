//
//  ViewController.swift
//  tumblr
//
//  Created by Matthew Sniff on 10/8/15.
//  Copyright © 2015 Matthew Sniff. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    // tab view controllers
    var homeVC: UIViewController!
    var searchVC: UIViewController!
    var composeVC: UIViewController!
    var accountVC: UIViewController!
    var trendingVC: UIViewController!
    
    // all vc's popped in here
    @IBOutlet weak var contentView: UIView!
    
    // other properties
    var currentlySelectedView: UIViewController?
    var currentlySelectedButton: UIButton?
    
    // view loaded
    override func viewDidLoad() {
       
        // init controller
        super.viewDidLoad()
        
        // get storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        
        // load view controllers by storyboardId
        homeVC = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchVC = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        composeVC = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        accountVC = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingVC = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        // load initial VC
        contentView.addSubview(homeVC.view)
        currentlySelectedView = homeVC
        
    }
    
    // tab has been selected
    @IBAction func onTabPressed(tabPressed: UIButton) {
   
        // set frame size of homeVC view to that of content view
        // homeVC.view.frame = contentView.frame
        
        // tapped home view
        if(tabPressed.tag == 100) {
            addChildViewController(homeVC)
            contentView.addSubview(homeVC.view)
            homeVC.didMoveToParentViewController(self)
            currentlySelectedView = homeVC
        }
        else if(tabPressed.tag == 200) {
            addChildViewController(searchVC)
            contentView.addSubview(searchVC.view)
            searchVC.didMoveToParentViewController(self)
            currentlySelectedView = searchVC
        }
        else if(tabPressed.tag == 300) {
            addChildViewController(composeVC)
            contentView.addSubview(composeVC.view)
            composeVC.didMoveToParentViewController(self)
            currentlySelectedView = composeVC
        }
        else if(tabPressed.tag == 400) {
            addChildViewController(accountVC)
            contentView.addSubview(accountVC.view)
            accountVC.didMoveToParentViewController(self)
            currentlySelectedView = accountVC
        }
        else if(tabPressed.tag == 500) {
            addChildViewController(trendingVC)
            contentView.addSubview(trendingVC.view)
            trendingVC.didMoveToParentViewController(self)
            currentlySelectedView = trendingVC
        }
  
        
    }
  

}

