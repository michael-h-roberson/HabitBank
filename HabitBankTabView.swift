//
//  HabitBankTabView.swift
//  HabitBank
//
//  Created by Michael Roberson on 5/29/24.
//

import SwiftUI

struct HabitBankTabView: View {
    
    @EnvironmentObject var manager: HealthManager
    //passing this into our view as an environment object
    @State var selectedTab = "Home"
    //this is how we handle which tab is selected
    //home is the default

    var body: some View {
        TabView(selection: $selectedTab) {
            //below is where we enter each tab we have in our app.
            HomeView()
                .tag("Home")
                //adding the image we want on the tab with tabItem
                .tabItem {
                    Image(systemName: "house")
                }
                .environmentObject(manager)
            
            ContentView()
                .tag("Content")
                .tabItem{
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    HabitBankTabView()
}
