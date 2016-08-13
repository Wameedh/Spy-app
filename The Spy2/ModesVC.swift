

//
//  Help.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 6/25/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import Foundation
import UIKit



class ModesVC: UIViewController {
    
    @IBOutlet weak var helpModeLable: UILabel!
    
    @IBOutlet var modeView: UIView!
    
    var textForLable: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        insertSubviewImage("spy",view: modeView,atIndex: 1, x: 30, y: 150, alpha: 0.3, transformX: 15, transformY: 0)
        gradientLayer(view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        helpModeLable.text = textForLable
        
    }
}
