//
//  ViewController.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 1/19/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var totalPlayers: Int = Int() // default number of players
    var numberOfSpies: Int?
    
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func numberOfSpiesForNumberOfPlayers(numberOfPlayers:Int)-> Int{
        switch numberOfPlayers {
        case 4, 5:
            return 1
        case 6, 7:
            return 2
        case 8, 9:
            return 3
        default:
            return 4
        }
    }

  
    
    @IBAction func didTapNumber(sender: AnyObject) {
        
        totalPlayers = sender.tag
        
        if  settings == .oneSpy {
            numberOfSpies = 1
        }else {
            numberOfSpies = numberOfSpiesForNumberOfPlayers(numberOfPlayers: totalPlayers)
        }
//        self.performSegue(withIdentifier: "push", sender: self)
        
        performSegue(withIdentifier: "push", sender: self)
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "push"{
            let destinationVC = segue.destination as? GameVC
            let spiesNumber = numberOfSpies
            
            destinationVC?.generateRandomWords(totalPlayers: totalPlayers, spies: spiesNumber!)
            destinationVC?.separaterSpiesFromPlayers(spiesNumber: spiesNumber!)
                
        }
    }
//     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destinationVC = segue.destination as? GameVC, let spiesNumber = numberOfSpies {
//            print("OK")
//            destinationVC.generateRandomWords(totalPlayers: totalPlayers, spies: spiesNumber)
//            destinationVC.separaterSpiesFromPlayers(spiesNumber: spiesNumber)
//
//        }
//
//    }
    
}
