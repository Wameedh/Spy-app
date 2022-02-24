//
//  SettingVC.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 5/17/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

var settings = SettingsState.settings(value: UserDefaults.standard.integer(forKey: "switchState"))

enum SettingsState:Int {
    case sameWords = 1
    case noWords = 2
    case wordCategury = 3
    case oneSpy = 4
    
    static func settings(value:Int)->SettingsState {
        if let setting = SettingsState(rawValue: value) {
            return setting
        }
        return SettingsState.sameWords
    }
    
    func switchOn(for state:SettingsState)->Bool {
        return self.rawValue == state.rawValue
    }
    
    func enabled(for state:SettingsState)->Bool {
        return self.rawValue != state.rawValue
    }
}

class SettingVC: UIViewController {
    

    @IBOutlet weak var sameWordsSW: UISwitch!
    
    @IBOutlet weak var spiesWithNoWordsSW: UISwitch!
    
    @IBOutlet weak var wordCategurySW: UISwitch!
    
    @IBOutlet weak var oneWordModeSW: UISwitch!
    
    
    func switchs() {
        sameWordsSW.isOn = settings.switchOn(for: .sameWords)
        spiesWithNoWordsSW.isOn = settings.switchOn(for: .noWords)
        wordCategurySW.isOn = settings.switchOn(for: .wordCategury)
        oneWordModeSW.isOn = settings.switchOn(for: .oneSpy)
        
        sameWordsSW.isUserInteractionEnabled = settings.enabled(for: .sameWords)
        spiesWithNoWordsSW.isUserInteractionEnabled = settings.enabled(for: .noWords)
        wordCategurySW.isUserInteractionEnabled = settings.enabled(for: .wordCategury)
        oneWordModeSW.isUserInteractionEnabled = settings.enabled(for: .oneSpy)
        
    }
    
    
    func modeInfoAlert() {
        var title: String = ""
        var message: String = ""
        switch settings {
        case .noWords:
            title = "Spies With No Words Mode"
            message = "Good Guys get the same words…. Spies get nothing.\n"+"-Easier Mode"
        case .sameWords:
            title = "Same Words Mode"
            message = "Good Guys get similar words from a category…… Spies get nothing.\n"+"-Slightly harder"
        case .wordCategury:
            title = "Words Category Mode"
            message = "Good guys and Spies will receive their own categories and similar words. In essence neither of you know what the hell is going on.  Use your logical reasoning to find out who is who.\n"+"-Hardest mode and most likely to break friendships"
        case .oneSpy:
            title = "One Spy Mode"
            message = "Spy, I’m sorry, at this point know the rest of your friends hate you. Your alone and no matter how many players are chosen you’ll always be alone.  Good Guys this will either be the easiest game to win or the most annoying and painful experience of your life. To find out one person is better than all of you.\n"+"-This mode may cause real murder"
        }
        
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor = UIColor.flammingoRed()
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func switchTaped(sender: AnyObject) {
        
        UserDefaults.standard.set(sender.tag, forKey: "switchState")
        settings = SettingsState.settings(value: sender.tag)
        switchs()
        modeInfoAlert()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertSubviewImage(imageName: "secret-agent",view: self.view,atIndex: 1, x: 30, y: 150, alpha: 0.2, transformX: 15, transformY: 0)
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        switchs()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
}
