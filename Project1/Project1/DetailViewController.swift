//
//  DetailViewController.swift
//  Project1
//
//  Created by jimmychain on 1/16/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    var detailItem: String?

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: String = self.detailItem {
            if let image = UIImage(named: detail) {
                imageview.image = image
                scrollView.contentSize = image.size
                scrollView.addSubview(imageview)
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
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        print("zooming...")
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        print("withView = \(view)")
        print("atScale = \(scale)")
    }
    
}

