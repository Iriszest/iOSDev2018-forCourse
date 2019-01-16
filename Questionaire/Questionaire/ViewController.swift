//
//  ViewController.swift
//  Questionaire
//
//  Created by Xinyi Huang on 2018/11/13.
//  Copyright © 2018年 Xinyi Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wolfValue = 20.0
    var catValue = 20.0
    var foxValue = 20.0
    var deerValue = 20.0
    var koalaValue = 20.0
    

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var birthLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationvc = segue.destination
        
        if let questionvc = destinationvc as? ViewController, let identifier = segue.identifier{
            
            print(identifier)

            switch identifier{
            case "cloakingMagic":
                questionvc.catValue += 20.0
                questionvc.wolfValue += 10.0
                questionvc.deerValue -= 10.0
            case "goBackMagic":
                questionvc.deerValue += 15.0
                questionvc.wolfValue -= 15.0
            case "readHeartMagic":
                questionvc.foxValue += 20.0
                questionvc.deerValue += 10.0
            case "A":
                questionvc.catValue += 10.0
                questionvc.foxValue += 10.0
            case "B":
                questionvc.wolfValue += 10.0
                questionvc.foxValue += 10.0
            case "C":
                questionvc.koalaValue += 25.0
                questionvc.deerValue -= 10.0
            case "D":
                questionvc.deerValue += 5.0
                questionvc.catValue += 20.0
            default: break
            }
        }
        
        if let chartvc = destinationvc as? BarChartViewController {
            if  nameLabel != nil, birthLabel != nil{
                chartvc.name = nameLabel.text ?? "我"
                print(chartvc.name)
                let birth = Int(birthLabel.text ?? "0") ?? 0
                if birth > 0 && birth <= 0430 {
                    deerValue += 20.0
                    koalaValue += 10.0
                    catValue -= 10
                } else if birth >= 0501 && birth <= 0831{
                    catValue += 10.0
                    koalaValue -= 15.0
                } else {
                    foxValue += 20
                    koalaValue += 10.0
                }
            }
            
            //"🐺狼","🐱猫","🦊狐","🦌鹿","🐨考拉"
            chartvc.animalValue[0] = wolfValue
            chartvc.animalValue[1] = catValue
            chartvc.animalValue[2] = foxValue
            chartvc.animalValue[3] = deerValue
            chartvc.animalValue[4] = koalaValue
        }
        
    }


}

