//
//  Health Manager.swift
//  HabitBank
//
//  Created by Michael Roberson on 5/29/24.
//

import Foundation
import HealthKit


extension Date {
    static var startOfDay: Date{
        Calendar.current.startOfDay(for: Date())
        //getting access to start of today.
    }
}

class HealthManager: ObservableObject {
    
    @Published var activities: [String : Activity] = [:]
    //making a dictionary of strings to activities
    //we're using a dictionary because we're going to loop through this.
    //and every item we have in this dictionary, we'll display in our homeview.
    
    //we're going to use a for each in our homeview
    //this allows us to re-usue our views and not have to re-write a whole bunch of code.
    
    let healthStore = HKHealthStore()
    //accessing the health data here^
    
    
    init(){
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        
        Task {
            do {
                
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                
            } catch {
                print("error fetching health data")
                
            }
        }
    }
    
    func fetchTodaySteps(){
        let steps = HKQuantityType(.stepCount)
        
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        //establishing when the start time and end time for measuring steps is.
        //"Date" means current momment.
        
        // a query is a request for information from a database
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching today's step data")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", image: "figure.walk", amount: "\(stepCount)")
            self.activities["todaySteps"] = activity
            //todaySteps is the sort of key in the dictionary for this activity.
            
            print(stepCount)
            

        }
        
        healthStore.execute(query)
        //we need to call this to execute our Query
        
    }
}

//converting step count double into a string with the proper comma formating and no decimal
extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
