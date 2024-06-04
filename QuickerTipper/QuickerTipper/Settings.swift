//
//  Settings.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 6/4/24.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var spacing:CGFloat = 50
    var numButtons:CGFloat = 3
    
    @Binding var themeColor:Int
    @Binding var iconColor:Int
    
    var body: some View {
        ZStack {
            // Page Background
            Rectangle()
                .fill(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
            
            
            GeometryReader { FullPage in
                VStack(spacing: FullPage.size.height / spacing) {
                    // Title
                    Text("App Settings")
                        .font(.system(size: FullPage.size.height / 25, weight: .heavy))
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    // Divider
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(height: 3)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    
                    // Buttons
                    GeometryReader { Buttons in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: FullPage.size.height / spacing) {
                                
                                // App Theme Button
                                GeometryReader { AppTheme in
                                    ZStack {
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                            .foregroundStyle(colorScheme == .dark ? darkGray : lightGray)
                                        
                                        // Text
                                        VStack {
                                            HStack {
                                                Text("App Theme")
                                                    .font(.system(size: AppTheme.size.height / 8, weight: .heavy))
                                                    .frame(height: AppTheme.size.height / 10)
                                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                                    .padding(.leading, AppTheme.size.height / 10)
                                                    .padding(.top, AppTheme.size.height / 10)
                                                Spacer()
                                            }
                                            
                                            GeometryReader { AppThemeButtons in
                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack (spacing: AppThemeButtons.size.height / 8) {
                                                        ForEach(ThemeButtons.allCases, id: \.self) { themeButtons in
                                                            themeButton(themeButtons: themeButtons, geometry: AppThemeButtons)
                                                        }
                                                    }
                                                }
                                            }
                                            .padding(10)
                                        }
                                    }
                                }
                                .frame(height: Buttons.size.height / numButtons - Buttons.size.height / spacing / numButtons)
                                
                                // App Icon Button
                                GeometryReader { AppIcon in
                                    ZStack {
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                            .foregroundStyle(colorScheme == .dark ? darkGray : lightGray)
                                        
                                        // Text
                                        VStack {
                                            HStack {
                                                Text("Icon Theme")
                                                    .font(.system(size: AppIcon.size.height / 8, weight: .heavy))
                                                    .frame(height: AppIcon.size.height / 10)
                                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                                    .padding(.leading, AppIcon.size.height / 10)
                                                    .padding(.top, AppIcon.size.height / 10)
                                                Spacer()
                                            }
                                            
                                            GeometryReader { AppIconButtons in
                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack (spacing: AppIconButtons.size.height / 8) {
                                                        ForEach(IconButtons.allCases, id: \.self) { iconButtons in
                                                            iconButton(iconButtons: iconButtons, geometry: AppIconButtons)
                                                        }
                                                    }
                                                }
                                            }
                                            .padding(10)
                                        }
                                    }
                                }
                                .frame(height: Buttons.size.height / numButtons - Buttons.size.height / spacing / numButtons)
                                
                                // About Page
                                NavigationLink(destination: About(themeColor: $themeColor, iconColor: $iconColor)) {
                                    GeometryReader { About in
                                        ZStack {
                                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                                .foregroundStyle(colorScheme == .dark ? darkGray : lightGray)
                                            
                                            VStack {
                                                HStack {
                                                    Text("About App")
                                                        .font(.system(size: About.size.height / 4, weight: .heavy))
                                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                                    Spacer()
                                                    Image(systemName: "chevron.forward.circle.fill")
                                                        .font(.system(size: About.size.height / 4, weight: .heavy))
                                                        .foregroundStyle(Color(uiColor: themeColor != 7 ? UIColorTheme : colorScheme == .dark ? .white : .black))
                                                }
                                                .padding(.horizontal, About.size.height / 5)
                                            }
                                        }
                                    }
                                }
                                .frame(height: Buttons.size.height / numButtons / 2 - Buttons.size.height / spacing / numButtons)
                            }
                        }
                    }
                    .padding(.bottom, FullPage.size.height / spacing)
                }
                .padding(.horizontal, 20)
                
                
                
                
            }
            
            
        }
    }
    
    @ViewBuilder
    private func themeButton(themeButtons: ThemeButtons, geometry: GeometryProxy) -> some View {
        Button {
            themeColor = themeButtons.rawValue
            updateTheme(colorInt: themeButtons.rawValue)
        } label : {
            VStack(spacing: geometry.size.height / 10) {
                Image(themeButtons.fileName(colorScheme: colorScheme))
                    .resizable()
                    .frame(width: geometry.size.height / 1.5, height: geometry.size.height / 1.5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Image(systemName: themeColor == themeButtons.rawValue ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: geometry.size.height / 6, weight: .heavy))
                    .foregroundStyle(themeButtons.color(colorScheme: colorScheme))
            }
        }
    }
    
    @ViewBuilder
    private func iconButton(iconButtons: IconButtons, geometry: GeometryProxy) -> some View {
        Button {
            iconColor = iconButtons.rawValue
            changeAppIcon(to: iconButtons.iconFileName())
        } label : {
            VStack(spacing: geometry.size.height / 10) {
                Image(iconButtons.logoFileName())
                    .resizable()
                    .frame(width: geometry.size.height / 1.5, height: geometry.size.height / 1.5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Image(systemName: iconColor == iconButtons.rawValue ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: geometry.size.height / 6, weight: .heavy))
                    .foregroundStyle(iconButtons.color(colorScheme: colorScheme))

            }
        }
    }
    
    private func changeAppIcon(to fileName:String) {
        UIApplication.shared.setAlternateIconName(fileName) { (error) in
            if let error = error {
            print("Failed request to update the app’s icon: \(error)")
            }
        }
    }
    
}

enum ThemeButtons:Int, CaseIterable {
    case red = 1, orange, yellow, green, blue, purple, blackWhite
    
    func fileName(colorScheme: ColorScheme) -> String {
        switch self {
        case .red:
            return "RedAppTheme"
        case .orange:
            return "OrangeAppTheme"
        case .yellow:
            return "YellowAppTheme"
        case .green:
            return "GreenAppTheme"
        case .blue:
            return "BlueAppTheme"
        case .purple:
            return "PurpleAppTheme"
        case .blackWhite:
            return colorScheme == .dark ? "WhiteAppTheme" : "BlackAppTheme"
        }
    }
    
    func color(colorScheme: ColorScheme) -> Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .blackWhite:
            return colorScheme == .dark ? .white : .black
        }
    }
}

enum IconButtons:Int, CaseIterable {
    case red = 1, orange, yellow, green, blue, purple, white, black
    
    func iconFileName() -> String {
        switch self {
        case .red:
            return "RedAppIcon"
        case .orange:
            return "OrangeAppIcon"
        case .yellow:
            return "YellowAppIcon"
        case .green:
            return "GreenAppIcon"
        case .blue:
            return "BlueAppIcon"
        case .purple:
            return "PurpleAppIcon"
        case .white:
            return "WhiteAppIcon"
        case .black:
            return "BlackAppIcon"
        }
    }
    
    func logoFileName() -> String {
        switch self {
        case .red:
            return "RedAppIconLogo"
        case .orange:
            return "OrangeAppIconLogo"
        case .yellow:
            return "YellowAppIconLogo"
        case .green:
            return "GreenAppIconLogo"
        case .blue:
            return "BlueAppIconLogo"
        case .purple:
            return "PurpleAppIconLogo"
        case .white:
            return "WhiteAppIconLogo"
        case .black:
            return "BlackAppIconLogo"
        }
    }
    
    func color(colorScheme: ColorScheme) -> Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .white:
            return colorScheme == .dark ? .white : .white
        case .black:
            return colorScheme == .dark ? .black : .black
        }
    }
}


#Preview {
    Settings(themeColor: .constant(1), iconColor: .constant(1))
}
