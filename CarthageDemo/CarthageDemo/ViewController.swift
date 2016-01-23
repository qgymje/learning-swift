//
//  ViewController.swift
//  CarthageDemo
//
//  Created by jimmychain on 1/22/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let json = JSON(["name":"Jack", "age": 25])
        if let name = json["address"].string {
            print(name)
            //Do something you want
        } else {
            print(json["address"].error) // "Dictionary["address"] does not exist"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

