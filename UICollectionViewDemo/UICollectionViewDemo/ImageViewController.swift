//
//  ImageViewController.swift
//  UICollectionViewDemo
//
//  Created by jimmychain on 1/30/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = image {
            imageView.image = img
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
