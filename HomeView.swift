//
//  HomeView.swift
//  HabitBank
//
//  Created by Michael Roberson on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    var body: some View {
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ActivityCard(activity: Activity(id: 0, title: "Daily steps", subtitle: "Goal: 10,000 ", image: "figure.walk", amount: "6,545"))
                
                ActivityCard(activity: Activity(id: 0, title: "Daily steps", subtitle: "Goal: 10,000 ", image: "figure.walk", amount: "6,545"))
                
            }
            .padding(.horizontal)
        }
        .onAppear{
            manager.fetchTodaySteps()
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
