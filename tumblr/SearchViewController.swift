//
//  SearchViewController.swift
//  tumblr
//
//  Created by Matthew Sniff on 10/8/15.
//  Copyright © 2015 Matthew Sniff. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // image vars
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images = [UIImage]()
    var animatedImage: UIImage!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var imageFrame: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        bgView.alpha = 1
        
        // assign loading images
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        imageFrame.image = animatedImage

        let delay = 1.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.bgView.alpha = 0
            self.imageFrame.alpha = 0
        }
        

    }
    
    

}
