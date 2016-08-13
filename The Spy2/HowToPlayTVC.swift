//
//  HowToPlayTVC.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 6/25/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

class HowToPlayTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insertSubviewImage("unclassified",view: self.tableView,atIndex: 1, x: 30, y: 150, alpha: 0.3, transformX: 15, transformY: 0)
        gradientLayer(view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
    }

    var cellIndex: Int?
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell?.textLabel?.text == "Instruction and How to Play" {
        self.performSegueWithIdentifier("navToHowToPlay", sender: self)
            
            
        } else {
            cellIndex = indexPath.row
            self.performSegueWithIdentifier("navToSameWordsMode", sender: self)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("helpCell", forIndexPath: indexPath)

        // Configure the cell...
        if indexPath.row == 0 {
            cell.textLabel?.text = "Instruction and How to Play"
        } else if indexPath.row == 1 {
        cell.textLabel?.text = "Same Words Mode"
        } else if indexPath.row == 2 {
        cell.textLabel?.text = "Spies With No Words Mode"
        }else if indexPath.row == 3{
            cell.textLabel?.text = "Words Category Mode"
        } else {
            cell.textLabel?.text = "One Spy Mode"
        }
        
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationVC = segue.destinationViewController as? ModesVC {
            if cellIndex == 1 {
                destinationVC.title = "Same Words Mode"
                destinationVC.textForLable = "Good Guys get the same words…. Spies get nothing.\n"+"-Easier Mode"
            } else if cellIndex == 2 {
                destinationVC.title = "Spies with no words mode"
                destinationVC.textForLable = "Good Guys get similar words from a category…… Spies get nothing.\n"+"-Slightly harder"
            
            }
            else if cellIndex == 3 {
                destinationVC.title = "Words Category Mode"
                destinationVC.textForLable = "Good guys and Spies will receive their own categories and similar words. In essence neither of you know what the hell is going on.  Use your logical reasoning to find out who is who.\n"+"-Hardest mode and most likely to break friendships"
            }
            else if cellIndex == 4 {
                destinationVC.title = "One Spy Mode"
                destinationVC.textForLable = "Spy, I’m sorry, at this point know the rest of your friends hate you. Your alone and no matter how many players are chosen you’ll always be alone.  Good Guys this will either be the easiest game to win or the most annoying and painful experience of your life. To find out one person is better than all of you.\n"+"-This mode may cause real murder"
            }
            
        }

    }
   

}
