//
//  ContentView.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    
    // Theme Storeage
    @AppStorage("themeColor") var themeColor:Int = 0
    @AppStorage("iconColor") var iconColor:Int = 0
    
    // Numbers
    
    var body: some View {
        TabView {
            
            // Bill
            NavigationView {
                
            } .tabItem {
                Label("Bill", systemImage: "fork.knife.circle")
            }
            
            // Compare
            NavigationView {
                
            } .tabItem {
                Label("Compare", systemImage: "square.split.2x1")
            }
            
            // Settings
            NavigationView {
                Settings()
            } .tabItem {
                Label("Settings", systemImage: "gear")
            }
            
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
