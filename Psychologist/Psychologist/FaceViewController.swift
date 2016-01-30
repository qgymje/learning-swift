//
//  ViewController.swift
//  FaceDemo
//
//  Created by jimmychain on 1/26/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceViewDataSource {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            let pinchGesture = UIPinchGestureRecognizer(target: faceView, action: "scale:")
            faceView.addGestureRecognizer(pinchGesture)
        }
    }
    // modle
    // 0 - 100
    var happiness: Int = 50 {
        didSet {
            happiness = min(max(0, happiness), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:break
        }
    }
    
    func smileForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

