//
//  HelpViewController.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 2/14/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit
import Foundation

class HowToPlay: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var instructionsLable: UILabel!
    
    @IBOutlet weak var helpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        
        insertSubviewImage(imageName: "unclassified",view: helpView,atIndex: 0, x: -190, y: 420, alpha: 0.3, transformX: 1, transformY: 0)
        insertSubviewImage(imageName: "secret-agent",view: helpView,atIndex: 0, x: 120, y:10, alpha: 0.2, transformX: 5, transformY: 0)
        
        let myString = self.instructionsLable.text!
        let myMutableString = NSMutableAttributedString(string: myString)
        let attri = [
                      NSAttributedString.Key.foregroundColor: UIColor.flammingoRed(),
                      NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                      ]
      myMutableString.addAttributes(attri, range: NSRange(location: 0, length: 13))
      myMutableString.addAttributes(attri, range: NSRange(location: 242, length: 9))
        myMutableString.addAttributes(attri, range: NSRange(location: 739, length: 23))
       myMutableString.addAttributes(attri, range: NSRange(location: 1042, length: 34))
    self.instructionsLable.attributedText = myMutableString
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
