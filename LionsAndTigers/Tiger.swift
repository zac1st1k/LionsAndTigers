//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Zac on 28/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var name = ""
    var age = 0
    var breed = ""
    var image = UIImage(named:"")
    func chuff () {
        println("Tiger: Chuff Chuff!")
    }
    func chuff (numberOfTimes:Int) {
        for numberOfTimes in 1...numberOfTimes{
            self.chuff()
        }
    }
    func chuff (numberOfTimes:Int, isLoud:Bool) {
        for numberOfTimes in 1...numberOfTimes{
            if isLoud == true {
                self.chuff()
            }
            else{
                println("Tiger: Purr Purr!")
            }
        }
    }
    func ageInTigerYear (regularAge:Int) -> Int {
        return regularAge * 3
    }
}