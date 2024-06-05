//
//  About.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 6/3/24.
//

import SwiftUI

struct About: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var lighterGray:Color = Color(red: 0.80, green: 0.80, blue: 0.80, opacity: 1.00)
    var darkerGray:Color = Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1.00)

    
    @Binding var themeColor:Int
    @Binding var iconColor:Int
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
            
            GeometryReader { FullPage in
                VStack(spacing: FullPage.size.height / 50) {
                    
                    Image(IconButtons(rawValue: iconColor)?.logoFileName() ?? "TransparentAppIconLogo")
                        .resizable()
                        .frame(width: FullPage.size.width / 1.25, height: FullPage.size.width / 1.25)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 3)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .padding(.top, FullPage.size.height / 75)
                    
                    Text("Quicker Tipper")
                        .font(.system(size: FullPage.size.height / 10, weight: .heavy))
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.20)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("v\(Bundle.main.releaseVersionNumber ?? "1.0.0").\(Bundle.main.buildVersionNumber ?? "1")")
                            .font(.system(size: FullPage.size.height / 20, weight: .heavy))
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .lineLimit(1)
                            .minimumScaleFactor(0.20)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    
                    ZStack {
                        VStack {
                            Spacer()
                            HStack {
                                Image("SonnazGroupTransparentLogo")
                                    .resizable()
                                    .frame(width: FullPage.size.height / 8, height: FullPage.size.height / 8)
                                Spacer()
                            }
                        }
                        
                        VStack {
                            Spacer()
                            Text("Sonnaz Group")
                            Text("© 2024. All Rights Reserved")
                        }
                        .font(.system(size: FullPage.size.height / 75, weight: .heavy))
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .padding(.bottom, FullPage.size.height / 40)

                        
                    }
                    
                    
                }
                .padding(.horizontal, FullPage.size.width / 20)
                
                
                
            }
            
            
        }
    }
    
    
    
}


#Preview {
    About(themeColor: .constant(1), iconColor: .constant(1))
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
