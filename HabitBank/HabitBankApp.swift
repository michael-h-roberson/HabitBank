//
//  HabitBankApp.swift
//  HabitBank
//
//  Created by Michael Roberson on 5/29/24.
//
//Fetch User's Step Data with HealthKit | Fitness App Swift UI #1
//resume @10:28

import SwiftUI

@main
struct HabitBankApp: App {
    @StateObject var manager = HealthManager()
    //^we will pass this into our view as an environment object
    
    var body: some Scene {
        WindowGroup {
            HabitBankTabView()
                .environmentObject(manager)
            
        }
    }
}
