//
//  PlayVC.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 2/13/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var numberOfPlayers: Int = 0
    var wordsForFinalArray: [String] = []
    var spiesOnly: [String] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let play = segue.destination as? TableVC {
        
        let play = segue.destination as? TableVC
        play?.numberOfplayersForCells(n: numberOfPlayers)
        play?.WordsForFinalArray(wordToBeAdd: wordsForFinalArray)
        play?.configureSpyArry(spiesWords: spiesOnly)
//        }
    }

}
