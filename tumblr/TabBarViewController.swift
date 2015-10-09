//
//  ViewController.swift
//  tumblr
//
//  Created by Matthew Sniff on 10/8/15.
//  Copyright © 2015 Matthew Sniff. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    // tab view controllers
    var homeVC: UIViewController!
    var searchVC: UIViewController!
    var composeVC: UIViewController!
    var accountVC: UIViewController!
    var trendingVC: UIViewController!
    
    // bubble
    @IBOutlet weak var exploreBubble: UIImageView!
    
    // all vc's popped in here
    @IBOutlet weak var contentView: UIView!
    
    // other properties
    var currentlySelectedView: UIViewController?
    var currentlySelectedButton: UIButton?
    var isPresenting: Bool = true
    var bobValue: CGFloat = 10.0
    @IBOutlet weak var homeButton: UIButton!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
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
        currentlySelectedButton = homeButton
        homeButton.setImage(UIImage(named: "home_selected_icon"), forState: .Normal)
        
        // animate the pop up to bob
        bobUpAndDown(bobValue)

        
    }
    
    // bobbing animation
    func bobUpAndDown(yOffset: CGFloat) {
        
        // animate the pop up to bob
        UIView.animateWithDuration(1.0, delay: 0.1, options: .CurveEaseOut, animations: {
            self.exploreBubble.frame = CGRectMake(self.exploreBubble.frame.origin.x, self.exploreBubble.frame.origin.y + self.bobValue, self.exploreBubble.frame.size.width, self.exploreBubble.frame.size.height)
            }, completion: { finished in
                self.bobValue = -1 * self.bobValue
                self.bobUpAndDown(self.bobValue)
        })
        
    }
    
    // tab has been selected
    @IBAction func onTabPressed(tabPressed: UIButton) {
   
        // set frame size of homeVC view to that of content view
        // homeVC.view.frame = contentView.frame
        
        
        // reset last button's icon to un-selected state
        if(currentlySelectedButton!.tag == 100) { currentlySelectedButton?.setImage(UIImage(named: "home_icon"), forState: .Normal) }
        else if(currentlySelectedButton!.tag == 200) { currentlySelectedButton?.setImage(UIImage(named: "search_icon"), forState: .Normal) }
        else if(currentlySelectedButton!.tag == 300) { currentlySelectedButton?.setImage(UIImage(named: "compose_icon"), forState: .Normal) }
        else if(currentlySelectedButton!.tag == 400) { currentlySelectedButton?.setImage(UIImage(named: "account_icon"), forState: .Normal) }
        else if(currentlySelectedButton!.tag == 500) { currentlySelectedButton?.setImage(UIImage(named: "trending_icon"), forState: .Normal) }
        
        // remove last added view controller
        currentlySelectedView?.willMoveToParentViewController(nil)
        currentlySelectedView?.view.removeFromSuperview()
        currentlySelectedView?.removeFromParentViewController()
        currentlySelectedButton = tabPressed
        currentlySelectedButton?.tag = tabPressed.tag
        
              // tapped home view
        if(tabPressed.tag == 100) {
            addChildViewController(homeVC)
            contentView.addSubview(homeVC.view)
            homeVC.didMoveToParentViewController(self)
            currentlySelectedView = homeVC
            tabPressed.setImage(UIImage(named: "home_selected_icon"), forState: .Normal)
            exploreBubble.hidden = false
        }
        else if(tabPressed.tag == 200) {
            addChildViewController(searchVC)
            contentView.addSubview(searchVC.view)
            searchVC.didMoveToParentViewController(self)
            tabPressed.setImage(UIImage(named: "search_selected_icon"), forState: .Normal)
            currentlySelectedView = searchVC
            exploreBubble.hidden = true
        }
        else if(tabPressed.tag == 300) {
            addChildViewController(composeVC)
            contentView.addSubview(composeVC.view)
            composeVC.didMoveToParentViewController(self)
            tabPressed.setImage(UIImage(named: "compose_selected_icon"), forState: .Normal)
            currentlySelectedView = composeVC
            exploreBubble.hidden = true
        }
        else if(tabPressed.tag == 400) {
            addChildViewController(accountVC)
            contentView.addSubview(accountVC.view)
            accountVC.didMoveToParentViewController(self)
            tabPressed.setImage(UIImage(named: "account_selected_icon"), forState: .Normal)
            currentlySelectedView = accountVC
            exploreBubble.hidden = false
        }
        else if(tabPressed.tag == 500) {
            addChildViewController(trendingVC)
            contentView.addSubview(trendingVC.view)
            trendingVC.didMoveToParentViewController(self)
            tabPressed.setImage(UIImage(named: "trending_selected_icon"), forState: .Normal)
            currentlySelectedView = trendingVC
            exploreBubble.hidden = false
        }
  
        
    }
    
    // segue for modally displaying compose VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
  
        var containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView!.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

  

}

