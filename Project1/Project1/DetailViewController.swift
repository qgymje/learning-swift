//
//  DetailViewController.swift
//  Project1
//
//  Created by jimmychain on 1/16/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: String = self.detailItem {
            if let image = imageview  {
                image.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped() {
        //let activity = UIActivityViewController(activityItems: [imageview.image!], applicationActivities: [])
        //presentViewController(activity, animated: true, completion: nil)
        let social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        social.setInitialText("hello world!")
        social.addImage(imageview.image!)
        social.addURL(NSURL(string: "http://weibo.com/"))
        presentViewController(social, animated: true, completion: nil)
    }
}

