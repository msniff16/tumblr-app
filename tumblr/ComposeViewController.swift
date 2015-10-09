//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Matthew Sniff on 10/8/15.
//  Copyright © 2015 Matthew Sniff. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // close modal
    @IBAction func onNevermind(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
