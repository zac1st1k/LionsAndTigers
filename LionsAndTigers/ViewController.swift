//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Zac on 28/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var factLabel: UILabel!
    
    var currentNumber = 0
    var tigers:[Tiger] = []
    var lions:[Lion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        tigers = [myTiger, secondTiger, thirdTiger, fourthTiger]
        println(tigers[currentNumber])
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        imageView.image = myTiger.image
        factLabel.text = randomFact()
        myTiger.chuff(3)
        secondTiger.chuff(2, isLoud: false)
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.name = "Mufasa"
        lion.image = UIImage(named: "Lion.jpg")
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lions = [lion, lioness]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toolbarButtonPressed(sender: UIBarButtonItem) {
        var randomNumber:Int
        do{
            randomNumber = Int(arc4random_uniform(UInt32(tigers.count)))
        } while currentNumber == randomNumber
        currentNumber = randomNumber
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            }, completion: {
                (finished: Bool) -> () in
        })
        self.imageView.image = self.tigers[randomNumber].image
        self.nameLabel.text = self.tigers[randomNumber].name
        self.ageLabel.text = "\(self.tigers[randomNumber].age)"
        self.breedLabel.text = self.tigers[randomNumber].breed
        factLabel.text = randomFact()


    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        return randomFact
    }
}

