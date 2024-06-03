//
//  Settings.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 6/1/24.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @Binding var themeColor:Int
    @Binding var iconColor:Int
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                // Background Color
                Rectangle()
                    .fill(colorScheme == .dark ? .black : .white)
                    .ignoresSafeArea()
                
                VStack {
                    // Title
                    Text("Settings")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .font(.system(size: geometry.size.height/25, weight: .heavy))
                        .minimumScaleFactor(0.10)
                        .frame(height: geometry.size.height / 20)
                        // .padding(.top, 10)
                    
                    // Spacer
                    Rectangle()
                        .fill(colorScheme == .dark ? .white : .black)
                        .frame(height: 3)
                        .padding(.top, -5)
                                        
                    GeometryReader { AppTheme in
                        VStack {
                            HStack {
                                Text("App Themes")
                                    .font(.system(size: AppTheme.size.height / 20, weight: .heavy))
                                    .foregroundStyle(Color(uiColor: themeColor != 7 ? UIColorTheme : colorScheme == .dark ? .white : .black))
                                Spacer()
                            }
                            .frame(height: AppTheme.size.height / 20)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .padding(.bottom, -20)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: AppTheme.size.width / 25) {
                                    ForEach(Theme.allCases, id: \.self) { theme in
                                        themeButton(theme: theme, geometry: AppTheme)
                                    }
                                }
                                .frame(height: AppTheme.size.height / 3.25)
                                .padding(.horizontal, 10)
                            }
                            .padding(.horizontal, 10)
                        }
                        .background(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(colorScheme == .dark ? darkGray : lightGray)
                        .padding(.bottom, 10)
                    }
                    
                    GeometryReader { IconTheme in
                        VStack {
                            HStack {
                                Text("App Icons")
                                    .font(.system(size: IconTheme.size.width / 10, weight: .heavy))
                                    .foregroundStyle(Color(uiColor: themeColor != 7 ? UIColorTheme : colorScheme == .dark ? .white : .black))
                                Spacer()
                            }
                                                    
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: IconTheme.size.width / 15) {
                                    ForEach(Icon.allCases, id: \.self) { icon in
                                        appIconButton(icon: icon, geometry: IconTheme)
                                    }
                                }
                            }
                        }
                        .frame(height: IconTheme.size.height)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(colorScheme == .dark ? darkGray : lightGray)
                    }
                    .padding(.bottom, 20)
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)

                
                
            }
            
            
        }
    
    
    
    }

    @ViewBuilder
    private func themeButton(theme: Theme, geometry: GeometryProxy) -> some View {
        VStack {
            Button {
                themeColor = theme.rawValue
                updateTheme(colorInt: themeColor)
            } label: {
                Image(theme.imageName(colorScheme: colorScheme))
                    .resizable()
                    .frame(width: geometry.size.height / 6, height: geometry.size.height / 6)
            }
            Image(systemName: themeColor == theme.rawValue ? "checkmark.circle.fill" : "circle")
                .font(.system(size: geometry.size.height / 25, weight: .heavy))
                .foregroundStyle(theme.color(colorScheme: colorScheme))
        }
        .frame(width: geometry.size.height / 6, height: geometry.size.height / 4)
    }
    
    @ViewBuilder
    private func appIconButton(icon: Icon, geometry: GeometryProxy) -> some View {
        VStack {
            Button {
                iconColor = icon.rawValue
                changeAppIcon(to: icon.iconName())
            } label: {
                Image(icon.imageName())
                    .resizable()
                    .frame(width: geometry.size.height / 2, height: geometry.size.height / 2)
            }
            Image(systemName: iconColor == icon.rawValue ? "checkmark.circle.fill" : "circle")
                .font(.system(size: geometry.size.height / 10, weight: .heavy))
                .foregroundStyle(colorScheme == .dark ? .white : .black)
        }
        .frame(width: geometry.size.height / 2, height: geometry.size.height / 1.5)
    }

}

enum Theme: Int, CaseIterable {
    case red = 1, orange, yellow, green, blue, purple, blackWhite

    func imageName(colorScheme: ColorScheme) -> String {
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

private func changeAppIcon(to fileName:String) {
    UIApplication.shared.setAlternateIconName(fileName) { (error) in
        if let error = error {
        print("Failed request to update the app’s icon: \(error)")
        }
    }
}

enum Icon: Int, CaseIterable {
    case red = 1, orange, yellow, green, blue, purple, white, black
    
    func imageName() -> String {
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
    
    func iconName() -> String {
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
}


#Preview {
    Settings(themeColor: .constant(7), iconColor: .constant(8))
}
