//
//  ContentView.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 5/28/24.
//

import SwiftUI

var lightGray:Color = Color(red: 0.90, green: 0.90, blue: 0.90, opacity: 1.00)
var darkGray:Color = Color(red: 0.10, green: 0.10, blue: 0.10, opacity: 1.00)

var ColorTheme:Color = .red
var UIColorTheme:UIColor = .systemRed
func updateTheme(colorInt:Int) {
    switch colorInt {
    case 1:
        UIColorTheme = .systemRed
        ColorTheme = .red
    case 2:
        UIColorTheme = .systemOrange
        ColorTheme = .orange
    case 3:
        UIColorTheme = .systemYellow
        ColorTheme = .yellow
    case 4:
        UIColorTheme = .systemGreen
        ColorTheme = .green
    case 5:
        UIColorTheme = .systemBlue
        ColorTheme = .blue
    case 6:
        UIColorTheme = .systemPurple
        ColorTheme = .purple
    default:
        break
    }
}

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
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
                Settings(themeColor: $themeColor, iconColor: $iconColor)
            } .tabItem {
                Label("Settings", systemImage: "gear")
            }
            
        }
        .tint(Color(uiColor: themeColor != 7 ? UIColorTheme : colorScheme == .dark ? .white : .black))
    }
}

#Preview {
    ContentView()
}
