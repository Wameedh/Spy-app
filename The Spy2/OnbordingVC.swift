//
//  OnbordingVC.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 4/24/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import Foundation
import UIKit

class OnBordingVC: UIViewController {
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        
        gradientLayer(view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
    }

    
    @IBAction func next(sender: AnyObject) {
        
        switch sender.tag {
        case 0:
            performSegueWithIdentifier("zero", sender: nil)
        case 1:
            performSegueWithIdentifier("one", sender: nil)
        case 2:
            performSegueWithIdentifier("two", sender: nil)
        case 3:
            performSegueWithIdentifier("three", sender: nil)
        case 4:
            performSegueWithIdentifier("fore", sender: nil)
        default:
            break
        }
    }

    
    @IBAction func Skip(sender: AnyObject) {
        
        
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: onbording)
        
      let ad =  UIApplication.sharedApplication().delegate as! AppDelegate
            ad.runStoryboard(main)
        
    }
    
}