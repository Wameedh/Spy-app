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
        gradientLayer(view: view, topColor: UIColor.lightGry(), bottomColor: UIColor.gry(), location: 1.0)
        view.backgroundColor = UIColor.gry()
      
    }
        
    
    var selectedRowIndex: NSIndexPath = IndexPath(row: -1, section: 0) as NSIndexPath
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//
//        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! TableViewCell
        
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        spyArrayHidden[indexPath.row] = false
        cell.spieOrNot.isHidden = false
        cell.lableForPlayerInCell.isHidden = false
        spyArrayShow.remove(at: indexPath.row)
        spyArrayShow.insert(true, at: indexPath.row)
        cell.tapToReveal.isHidden = true
        
    }
    
    

    @IBAction func didTapPlayAgain(sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        self.navigationController?.popToRootViewController(animated: true)
        
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
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSections!
    }
//   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//
//        return numberOfSections!
//    }
    
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
            if spiesWords.contains(word){
                spyArray.append(true)
            } else {
                spyArray.append(false)
            }
        }
    }

    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
//         Configure the cell...
    cell.riceive(lableText: finalArrayOfWords[indexPath.row])
       
        if spyArray[indexPath.row] == true {
        cell.spieOrNot.text = "Spy😈"
        } else {
            cell.spieOrNot.text = "Good guy😎"
        }
        
    cell.spieOrNot.isHidden = spyArrayHidden[indexPath.row]
    cell.lableForPlayerInCell.isHidden = spyArrayHidden[indexPath.row]
    cell.tapToReveal.isHidden = spyArrayShow[indexPath.row]
        
    let image = UIImage(named: "Player-\(indexPath.row + 1)")!
    cell.imageForCell.image = image
        
        
    return cell
        
    }
    
}
