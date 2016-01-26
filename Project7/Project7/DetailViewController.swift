//
//  DetailViewController.swift
//  Project7
//
//  Created by jimmychain on 1/25/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailItem: String?
    
    @IBOutlet weak var detailLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let detail = detailItem {
            print("\(detail)")
            print("\(detailLable)")
            detailLable.text! = detail
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
