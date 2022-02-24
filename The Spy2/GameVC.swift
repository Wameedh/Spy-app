//
//  GameVC.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 1/24/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    var words = WordGroups()
    var numberOfPlayers: Int?
    var numberOfSpies: Int?
    
    @IBOutlet weak var revealWordView: UIView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var revealTheWordButton: UIButton!
    @IBOutlet weak var wordLabel: UILabel!
    
    var randomWordArray : [String] = []
    
    
    // function alert calld in the viewDidLad
    func alert() {
        // assign a singular or plural word of "spy" to the string of the alert message
        var spy = ""
        if numberOfSpies == 1 {
            //singular
            spy = "SPY"
        } else {
            //plural
            spy = "SPIES"
        }
        
        var title: String = ""
        switch settings {
        case .noWords:
            title = "Spies With No Words Mode"
        case .sameWords:
             title = "Same Words Mode"
        case .wordCategury:
            title = "Words Category Mode"
        case .oneSpy:
            title = "One Spy Mode"
        }
        
        
        
        // create the alert
        if let spiesNumber = numberOfSpies, let goodPlayersNumber = numberOfPlayers {
            let alert = UIAlertController(title: "\(title)/\(goodPlayersNumber) Players", message: " There will be \(goodPlayersNumber - spiesNumber) GOOD GUYS and \(spiesNumber) \(spy)", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "START", style: UIAlertAction.Style.default, handler: nil))
            alert.view.tintColor = UIColor.flammingoRed()
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert()
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(),  location: 1.0)
        gradientLayer(view: revealWordView, topColor: UIColor.lightGry() , bottomColor: UIColor.gry(), location: 1.5)
        let backgroundImage = UIImageView(frame: CGRect(x: 50, y: 75, width: 275, height: 200))
        backgroundImage.image = UIImage(named: "TOP SECRET")
        self.revealWordView.insertSubview(backgroundImage, at: 1)

    }
    
  func generateRandomWords(totalPlayers: Int, spies: Int) {
    randomWordArray = words.player(total: totalPlayers, totalSpies: spies)
    
      numberOfPlayers = totalPlayers
      numberOfSpies = spies
    }
    
    var arrayOfSpiesOnly: [String] = []
    func separaterSpiesFromPlayers(spiesNumber: Int) {
         var arrayOfNonSpiesPlayers = randomWordArray //this var help to keep the orgenal randoWordArry form changing because we need to use it for a different purpose
        for _ in 0..<spiesNumber {
         arrayOfSpiesOnly.append(arrayOfNonSpiesPlayers.removeLast())
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var number = 1 // This variable controlles when and when not the buttons (revealTheWordButton & nextPlayerButton) functions also it control when the number Of Players Counter method function.
    
    var arrayWordsForFinalArray: [String] = []
    func arrangeWordsForFinalArray(wordToBeAdd: String){
        arrayWordsForFinalArray.append(wordToBeAdd)
    }

    
    func configureWordLableAfterRevealTheWordButtonPressed(){
        let randomWord = Int(arc4random()) % randomWordArray.count
        self.wordLabel.text = randomWordArray.remove(at: randomWord)
        self.wordLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.white, thickness: 1.0)
        self.wordLabel.isHidden = false
        // appand the word to arrayWordsForFinalArray
        arrangeWordsForFinalArray(wordToBeAdd: wordLabel.text!)
        
    }
    
    func animateRevealWordViewAppearing(view: UIView, animateTime: TimeInterval) {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIView.AnimationCurve.linear)
        UIView.setAnimationDuration(animateTime)
        UIView.setAnimationTransition(UIView.AnimationTransition.flipFromRight, for: view, cache: false)
        UIView.commitAnimations()
        revealWordView.alpha = 1.0
    }
    
    
    func animateRevealWordViewDisappearing() {
        let seconds : TimeInterval = 1
        revealWordView.alpha = 1
        UIView.animate(withDuration: seconds) { () -> Void in
            self.revealWordView.alpha = 0
            
        }
    }
    
   
    var countOfPlayers = 1
    @IBAction func revealTheWordButton(sender: UIButton) {
        animateRevealWordViewAppearing(view: revealWordView, animateTime: 1)
            configureWordLableAfterRevealTheWordButtonPressed()
            number += 1
    }
    
    
    @IBAction func didTapGotIt(sender: UIButton) {
        revealWordView.alpha = 0
        
        if countOfPlayers == numberOfPlayers && number == 2 {
            performSegue(withIdentifier: "navToPlay", sender: nil)
        }
        else if number == 2 {
            configureWordLableAfterGotItButtonPressed()
            changingPlayerImage()
            number = 1
            countOfPlayers += 1
        }
        
    }

    
    
    var num = 1

    func changingPlayerImage() {
        //This function start counted from 2 till the total number of Players. It used in the GotItButton to retrive the image of each player acurding to the player number.
        if num < numberOfPlayers! && number == 2 {
            num += 1
        }
        playerImage.image = UIImage(named: "Player-\(num)")
    }
    
    
    
    func configureWordLableAfterGotItButtonPressed(){
        self.wordLabel.isHidden = true
    }
    

    
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "push"{
        
            let play = segue.destination as? PlayVC
            let playersNumber = numberOfPlayers
            play?.numberOfPlayers = playersNumber!
            play?.wordsForFinalArray = arrayWordsForFinalArray
            play?.spiesOnly = arrayOfSpiesOnly
            //Data has to be a variable name in your RandomViewController
//        }
    }

}
