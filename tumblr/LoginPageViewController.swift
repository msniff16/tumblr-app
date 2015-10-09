//
//  LoginPageViewController.swift
//  tumblr
//
//  Created by Matthew Sniff on 10/9/15.
//  Copyright © 2015 Matthew Sniff. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // cancel the login
    @IBAction func onCancelLogin(sender: UIButton) {
        
        cancelButton.backgroundColor =  UIColor(colorLiteralRed: 4/255.0, green: 250/255.0, blue: 252/255.0, alpha: 1.0)
        let delay = 0.4 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

}
