//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by jimmychain on 1/30/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    var data: [Dictionary<String,String>] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(data.count)
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyUICollectionViewCell
        cell.imageView.image = UIImage(named: data[indexPath.row]["image"]!)
        cell.titleLabel.text = data[indexPath.row]["title"]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("did select tiem at indexPath")
        performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "showImage":
                    // get indexPath
                    let indexPaths = collectionView.indexPathsForSelectedItems()!
                    let indexPath = indexPaths[0] as NSIndexPath
                    
                    // grab data
                    let passingData = data[indexPath.row]
                    
                    // send to desiginationViewController
                    let vc = segue.destinationViewController as! ImageViewController
                    
                    // passing data
                    vc.image = UIImage(named:passingData["image"]!)
                    vc.title = passingData["title"]
                
                
                default: break
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [
            ["image":"image1", "title": "黑暗之女"],
            ["image":"image2", "title": "哥特萝莉"],
            ["image":"image3", "title": "小红帽"],
            ["image":"image4", "title": "梦游仙境"],
            ["image":"image5", "title": "舞会公主"],
            ["image":"image6", "title": "冰霜烈焰"],
            ["image":"image7", "title": "安伯斯与提妮"],
            ["image":"image8", "title": "科学怪熊的新娘"],
            ["image":"image9", "title": "“你看见过我的熊猫吗？”"],
            ["image":"image10", "title": "甜心宝贝"],
        ]
        print("data = \(data)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

