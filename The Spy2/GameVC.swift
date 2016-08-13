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
        if let spiesNumber = numberOfSpies, goodPlayersNumber = numberOfPlayers {
            let alert = UIAlertController(title: "\(title)/\(goodPlayersNumber) Players", message: " There will be \(goodPlayersNumber - spiesNumber) GOOD GUYS and \(spiesNumber) \(spy)", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "START", style: UIAlertActionStyle.Default, handler: nil))
            alert.view.tintColor = UIColor.flammingoRed()
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert()
        gradientLayer(view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(),  location: 1.0)
        gradientLayer(revealWordView, topColor: UIColor.lightGry() , bottomColor: UIColor.gry(), location: 1.5)
        let backgroundImage = UIImageView(frame: CGRectMake(50, 75, 275, 200))
        backgroundImage.image = UIImage(named: "TOP SECRET")
        self.revealWordView.insertSubview(backgroundImage, atIndex: 1)

    }
    
  func generateRandomWords(totalPlayers: Int, spies: Int) {
      randomWordArray = words.player(totalPlayers, totalSpies: spies)
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
        let randomWord = random() % randomWordArray.count
        self.wordLabel.text = randomWordArray.removeAtIndex(randomWord)
        self.wordLabel.layer.addBorder(UIRectEdge.Bottom, color: UIColor.whiteColor(), thickness: 1.0)
        self.wordLabel.hidden = false
        // appand the word to arrayWordsForFinalArray
        arrangeWordsForFinalArray(wordLabel.text!)
        
    }
    
    func animateRevealWordViewAppearing(view: UIView, animateTime: NSTimeInterval) {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.Linear)
        UIView.setAnimationDuration(animateTime)
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: view, cache: false)
        UIView.commitAnimations()
        revealWordView.alpha = 1.0
    }
    
    
    func animateRevealWordViewDisappearing() {
        let seconds : NSTimeInterval = 1
        revealWordView.alpha = 1
        UIView.animateWithDuration(seconds) { () -> Void in
            self.revealWordView.alpha = 0
            
        }
    }
    
   
    var countOfPlayers = 1
    @IBAction func revealTheWordButton(sender: UIButton) {
            animateRevealWordViewAppearing(revealWordView, animateTime: 1)
            configureWordLableAfterRevealTheWordButtonPressed()
            number += 1
    }
    
    
    @IBAction func didTapGotIt(sender: UIButton) {
        revealWordView.alpha = 0
        
        if countOfPlayers == numberOfPlayers && number == 2 {
            performSegueWithIdentifier("navToPlay", sender: nil)
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
        if num < numberOfPlayers && number == 2 {
            num += 1
        }
        playerImage.image = UIImage(named: "Player-\(num)")
    }
    
    
    
    func configureWordLableAfterGotItButtonPressed(){
        self.wordLabel.hidden = true
    }
    

    
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if let play = segue.destinationViewController as? PlayVC, let playersNumber = numberOfPlayers {
            play.numberOfPlayers = playersNumber
            play.wordsForFinalArray = arrayWordsForFinalArray
            play.spiesOnly = arrayOfSpiesOnly

        }
    }

}
