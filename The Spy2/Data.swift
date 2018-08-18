//
//  Data.swift
//  The Spy
//
//  Created by Wameedh Mohammed Ali on 1/19/16.
//  Copyright © 2016 Wameedh Mohammed Ali. All rights reserved.
//

import Foundation
import UIKit

//////////
//COLORS//
/////////

extension UIColor {
 
    static func flammingoRed()->UIColor {
        return UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)    }
    static func lightGry()-> UIColor {
    return UIColor(red: 127.0/255.0, green: 140.0/255.0, blue: 141.0/255.0, alpha: 1.0)
    }
    static func gry()-> UIColor {
        return UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    }
    
}


struct WordGroups {
    
    let array3dCatugoryOfWords:[[[String]]] = [
        
        // array3dCatugoryOfWords index[0]: Words Of Sports
        [
            //array3dCatugoryOfWords index[0][0][Players Words]
            ["Baseball","Cricket","Tennis","Squash","Volleyball","Beach volleyball","Water volleyball","Softball","Polo","Soccer","American Football","Rugby"],
            //array3dCatugoryOfWords index[0][1][Spy Words]
            ["Wrestling","Judo","Kickboxing","Jujutsu","Brazilian Jiu-Jitsu","Sumo","Boxing","Karate"]
        ],
        //array3dCatugoryOfWords index[1]: Of Words Of Drinks
        [
            //array3dCatugoryOfWords index[1][0][Players Words]
            ["Coffee","Coke","Green Tea","Ice Coffee","Ice Tea","Juice","Lemonade","Milk","Milkshake","Orange Juice","Soda","Soft Drink","Tea","Tomato Juice","Water"],
            //array3dCatugoryOfWords index[1][0][Spy Words]
            ["Whiskey","Wine","Beer","Brandy","Cocktail","Martini","Gin","Rum","Tequila","Vodka","Margarita"]
        ],
        //array3dCatugoryOfWords index[2]: Words Of Countries
        [
            //array3dCatugoryOfWords index[2][0][Players Words]
            ["Afghanistan","Bahrain","Bangladesh","China","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Lebanon","Malaysia","Mongolia","NorthKorea","Oman","Pakistan","Palestine","Philippines","Qatar","Saudi Arabia","Singapore","South Korea","Syria","Taiwan","Thailand","United Arab Emirates","Vietnam","Yemen"],
            //array3dCatugoryOfWords index[2][1][Spy Words]
            ["Albania","Armenia","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina","Bulgaria","Croatia","Czech Republic","Denmark","Estonia","Finland","France","Georgia","Germany","Hungary","Iceland","Ireland","Italy","Netherlands","Norway","Portugal","Spain","Sweden","Ukraine","United Kingdom"]
        ],
        //array3dCatugoryOfWords index[3]: Words Of Seas
        [
            //array3dCatugoryOfWords index[3][0][Players Words]
            ["Red Sea","Arabian Sea","White Sea","Dead Sea","Java Sea","Philippine Sea","Baltic Sea","Mediterranean Sea","Balearic Sea","Ionian Sea","Marmara Sea","Caribbean Sea"],
            //array3dCatugoryOfWords index[3][1][Spy Words]
            ["Southern Ocean","Atlantic Ocean","Arctic Ocean","Indian Ocean","Pacific Ocean"]
        ],
        
        // array3dCatugoryOfWords index[4]: Words Of Fruit and Vegetables
        [
            //array3dCatugoryOfWords index[4][0][Players Words]
            ["Peach","Kiwi","Blueberry","Plum","Strawberry","Pear","Pineapple","Apple","Pomegranite","Banana","Orange","Blackberry","Star fruit","Mandarin Orange","Mango","watermelon"],
            //array3dCatugoryOfWords index[4][1][Spy Words]
            ["Basil","Spinach","Beans","Bell Pepper","Broccoli","Potato","Carrot","Olive","Cabbage","Sweet Potato","Onion","Cucumber"]
        ],
        //array3dCatugoryOfWords index[5]: Words Of Cities & Countries
        [
            //array3dCatugoryOfWords index[5][0][Players Words]
            ["Bombay", "Los Angeles", "Malay","Basra","Monterey","San Jose","Santa Cruz","Barcelona","Dubai","Seville","Kuwait City","Madrid","Arbil","Montreal","Baghdad","Cairo","Abu Dhabi"],
            //array3dCatugoryOfWords index[5][1][Spy Words]
            ["Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Lebanon","Armenia","Belgium","Finland","France","Georgia","Germany","Vietnam","United Arab Emirates","Philippines","South Korea","Hungary","Iceland","Ireland","Italy","Netherlands","Norway","China","Portugal","Spain","Sweden","Ukraine","United Kingdom"]
        ],
        //array3dCatugoryOfWords index[6]: Words Of Animals
        [
            //array3dCatugoryOfWords index[6][0][Players Words]
            ["Shark","Jellyfish","Whale","Seahorse","Starfish","Snails","Crab","Dolphin","Squid","Sea Turtle","Frog","Catfish",
                "Salmon","Lion Fish","Alligtor"],
            //array3dCatugoryOfWords index[6][1][Spy Words]
            ["Eagle","Lion","Tiger","Elephant","Owl","Fox","Dog","Cat","Snake","Caw","Monkey","Horse","Swan","Bear","Squirrel","Water Buffalo","Wolf","Zebra"]
        ],
        
        //array3dCatugoryOfWords index[7]: Words Of names Months & days
        [
            //array3dCatugoryOfWords index[7][0][Players Words]
            ["January","February","March","April","May","June","July","August","September","October","November","December"],
            //array3dCatugoryOfWords index[7][1][Spy Words]
            ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        ],
        
        //array3dCatugoryOfWords index[8]: Words Of names majors
        [
            //array3dCatugoryOfWords index[8][0][Players Words]
            ["Biophysics","Kinesiology","Applied Math Sciences","Biology","Chemistry","Mathematics","Physics","Space Science","Computer Science","Electrical Engineering","Medicine Science","Atomic Physics","Civil Engineering"],
            //array3dCatugoryOfWords index[8][1][Spy Words]
            ["Fine Art","Visual Art","Graphic Design","Fashion","Performing Art","Music Studies","Filming","Photography","Philosophy","Writing","Literature","Acting"]
        ],
        
        //array3dCatugoryOfWords index[9]: Words Of names USA Pres. and famous people
        [
            //array3dCatugoryOfWords index[9][0][Players Words]
            ["George Washington", "Thomas Jefferson", "Abraham Lincoln","Theodore Roosevelt", "John F. Kennedy", "Richard Nixon", "Jimmy Carter", "Ronald Reagan", "George H. W. Bush","Bill Clinton", "George W. Bush", "Barack Obama"],
            //array3dCatugoryOfWords index[9][1][Spy Words]
            ["Malcolm X", "Joe Biden","Oprah Winfrey","Martin Luther King Jr.","Arnold Schwarzenegger"]
        ]
    ]
    
    

    
    func player(total:Int, totalSpies:Int)->[String] {
        srandom(UInt32(Int(time(nil)))) // seed the random generator w/ time?
        let categoryNumber = Int(arc4random()) % array3dCatugoryOfWords.count
        var allPlayers = [String]()
        var players = array3dCatugoryOfWords[categoryNumber][0]
        var spies: [String] = ["YOU ARE A SPY!","YOU ARE A SPY","YOU ARE A SPY","YOU ARE A SPY"]
        
        func appendingPlayersWords() {
            for _ in 0..<total  - totalSpies {
                let playerNumber = Int(arc4random()) % players.count
                allPlayers.append(players.remove(at: playerNumber))
            }
        }
        func appendingSpiesWords(){
            for _ in 0..<totalSpies {
                let spyNumber = Int(arc4random()) % spies.count
                allPlayers.append(spies.remove(at: spyNumber))
            }
        }
       
        
        switch settings {
        case .sameWords:
            let playerNumber = Int(arc4random()) % players.count
            for _ in 0..<total  - totalSpies {
                allPlayers.append(players[playerNumber])
            }
            appendingSpiesWords()
        case .noWords:
            appendingPlayersWords()
            appendingSpiesWords()
        case .wordCategury:
            spies = array3dCatugoryOfWords[categoryNumber][1]
            appendingPlayersWords()
            appendingSpiesWords()
        case .oneSpy:
            let playerNumber = Int(arc4random()) % players.count
            for _ in 0..<total  - 1 {
                allPlayers.append(players[playerNumber])
            }
            
            for _ in 0..<1 {
                let spyNumber = Int(arc4random()) % spies.count
                allPlayers.append(spies.remove(at: spyNumber))
            }
            
        }
        

        return allPlayers
    }
    
}


func insertSubviewImage(imageName: String, view: UIView, atIndex: Int, x: CGFloat, y: CGFloat, alpha: CGFloat, transformX: CGFloat, transformY: CGFloat)-> Void {
    
    let backgroundImage = UIImageView(frame: CGRect(x: x, y: y, width: 0, height: 0))
    backgroundImage.image = UIImage(named: imageName)
    backgroundImage.sizeToFit()
    backgroundImage.alpha = alpha
    
    if transformX > 0 || transformX < 0{
        // Desired point from the center to rotate around
        let tx = transformX
        let ty = transformY
        var transform = CGAffineTransform(translationX: tx, y: ty)
        transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi / 4))
        transform = CGAffineTransform.init(translationX: -tx, y: -ty)
        backgroundImage.transform = transform
    }
    return view.insertSubview(backgroundImage, at: atIndex)
}


extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        

        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}


