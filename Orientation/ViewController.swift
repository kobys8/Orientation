//
//  ViewController.swift
//  Orientation
//
//  Created by Koby Samuel on 11/29/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var orientationLabel: UILabel!
	//var currentRotationOfLabel: Int = 0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "orientationChanged:", name: "UIDeviceOrientationDidChangeNotification", object: nil)
	}

	func orientationChanged(notification: NSNotification) {
		let orientation: UIDeviceOrientation = UIDevice.currentDevice().orientation
		switch(orientation) {
		case UIDeviceOrientation.FaceUp:
			orientationLabel.text = "Face Up"
		case UIDeviceOrientation.FaceDown:
			orientationLabel.text = "Face Down"
		case UIDeviceOrientation.Portrait:
			orientationLabel.text = "Standing Up"
			if(atan2(orientationLabel.transform.b, orientationLabel.transform.a) == 180) {
				orientationLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
				//currentRotationOfLabel = 0
			}
		case UIDeviceOrientation.PortraitUpsideDown:
			orientationLabel.text = "Upside Down"
			if(atan2(orientationLabel.transform.b, orientationLabel.transform.a) == 0) {
				orientationLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
				//currentRotationOfLabel = 180
			}
		case UIDeviceOrientation.LandscapeLeft:
			orientationLabel.text = "Left Side"
			if(atan2(orientationLabel.transform.b, orientationLabel.transform.a) == 180) {
				orientationLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
				//currentRotationOfLabel = 0
			}
		case UIDeviceOrientation.LandscapeRight:
			orientationLabel.text = "Right Side"
			if(atan2(orientationLabel.transform.b, orientationLabel.transform.a) == 180) {
				orientationLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
				//currentRotationOfLabel = 0
			}
		default:
			orientationLabel.text = "Unknown"
		}
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		return UIInterfaceOrientationMask.All
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

