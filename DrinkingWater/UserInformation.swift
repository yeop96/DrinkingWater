//
//  UserInformation.swift
//  DrinkingWater
//
//  Created by yeop on 2021/10/12.
//

import UIKit

struct UserInformation: Codable {

    struct UserInfo: Codable {
        var nickName: String
        var height: Int
        var weight: Int
        var accumulateWater: Int = 0
        var recommendIntake: Float { return Float(height + weight)/100.0 }
        var percentGoal: Int { return Int(Float(accumulateWater) / (recommendIntake * 1000.0) * 100.0) }
    }
    
    static func isFirstTime() -> Bool {
            let defaults = UserDefaults.standard
            if defaults.object(forKey: "isFirstTime") == nil {
                //defaults.set("No", forKey:"isFirstTime")
                return true
            } else {
                return false
            }
    }
}
