//
//  ViewController.swift
//  Psychologist
//
//  Created by jimmychain on 1/27/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCtrl = destination as? UINavigationController {
            destination = navCtrl.visibleViewController
        }
        
        if let detailVC = destination as? FaceViewController {
            if let identifier = segue.identifier{
                switch identifier {
                    case "happy": detailVC.happiness = 100
                    case "sad": detailVC.happiness = 0
                    default: detailVC.happiness = 50
                }
            }
        }
    }
}

