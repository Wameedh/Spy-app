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
        
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
    }

    
    @IBAction func next(sender: AnyObject) {
        
        switch sender.tag {
        case 0:
            performSegue(withIdentifier: "zero", sender: nil)
        case 1:
            performSegue(withIdentifier: "one", sender: nil)
        case 2:
            performSegue(withIdentifier: "two", sender: nil)
        case 3:
            performSegue(withIdentifier: "three", sender: nil)
        case 4:
            performSegue(withIdentifier: "fore", sender: nil)
        default:
            break
        }
    }

    
    @IBAction func Skip(sender: AnyObject) {
        
        
        UserDefaults.standard.set(true, forKey: onbording)
        
        let ad =  UIApplication.shared.delegate as! AppDelegate
        ad.runStoryboard(Story: main)
        
    }
    
}
