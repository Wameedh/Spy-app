//
//  TableVC.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 1/26/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer(view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        view.backgroundColor = UIColor.gry()
    }
    
    
    var selectedRowIndex: NSIndexPath = NSIndexPath(forRow: -1, inSection: 0)
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
        spyArrayHidden[indexPath.row] = false
        cell.spieOrNot.hidden = false
        cell.lableForPlayerInCell.hidden = false
        spyArrayShow.removeAtIndex(indexPath.row)
        spyArrayShow.insert(true, atIndex: indexPath.row)
        cell.tapToReveal.hidden = true
        
    }
    
    

    @IBAction func didTapPlayAgain(sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    var numberOfSections: Int?
    func numberOfplayersForCells(n: Int) {
        numberOfSections = n
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
          return 1
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        return numberOfSections!
    }
    
    var finalArrayOfWords: [String] = []
    func WordsForFinalArray(wordToBeAdd: [String]){
        finalArrayOfWords = wordToBeAdd
  //In this fuction we recieved Words from arrayWordsForFinalArray in the GameVC and will asign it to the finalArrayOfWords that will be used to give a word for each cell lable
    }
    
    var spyArrayHidden = [true,true,true,true,true,
    true,true,true,true,true]
    
    var spyArrayShow = [false,false,false,false,false,
       false,false,false,false,false]
    
    var spyArray = [Bool]()
    func configureSpyArry(spiesWords: [String]) {
        for word in finalArrayOfWords {
            if spiesWords.contains({spyWord in
                spyWord == word
            }){
                spyArray.append(true)
            } else {
                spyArray.append(false)
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
//         Configure the cell...
        cell.riceive(finalArrayOfWords[indexPath.row])
        
        if spyArray[indexPath.row] == true {
        cell.spieOrNot.text = "Spy😈"
        } else {
            cell.spieOrNot.text = "Good guy😎"
        }
        
        cell.spieOrNot.hidden = spyArrayHidden[indexPath.row]
        cell.lableForPlayerInCell.hidden = spyArrayHidden[indexPath.row]
        cell.tapToReveal.hidden = spyArrayShow[indexPath.row]
        
        let image = UIImage(named: "Player-\(indexPath.row + 1)")!
        cell.imageForCell.image = image
        
        
        return cell
        
    }
    
}
