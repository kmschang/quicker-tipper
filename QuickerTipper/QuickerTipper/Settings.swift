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
                    
                    Spacer()
                    
                    
                    // App Theme Button
                    VStack {
                        HStack {
                            Text("App Themes")
                                .font(.system(size: geometry.size.height / 30, weight: .heavy))
                                .foregroundStyle(Color(uiColor: themeColor != 7 ? UIColorTheme : colorScheme == .dark ? .white : .black))
                            Spacer()
                        }
                        .frame(height: geometry.size.height / 30)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                VStack {
                                    Button {
                                        themeColor = 1
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(.red)
                                    }
                                    Image(systemName: themeColor == 1 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(.red)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)

                                VStack {
                                    Button {
                                        themeColor = 2
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(.orange)
                                    }
                                    Image(systemName: themeColor == 2 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(.orange)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)

                                VStack {
                                    Button {
                                        themeColor = 3
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(.yellow)
                                    }
                                    Image(systemName: themeColor == 3 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(.yellow)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)

                                VStack {
                                    Button {
                                        themeColor = 4
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(.green)
                                    }
                                    Image(systemName: themeColor == 4 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(.green)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)

                                VStack {
                                    Button {
                                        themeColor = 5
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(.blue)
                                    }
                                    Image(systemName: themeColor == 5 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(.blue)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)

                                VStack {
                                    Button {
                                        themeColor = 6
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(.purple)
                                    }
                                    Image(systemName: themeColor == 6 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(.purple)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)

                                VStack {
                                    Button {
                                        themeColor = 7
                                        updateTheme(colorInt: themeColor)
                                    } label : {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: geometry.size.height / 9, weight: .heavy))
                                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    }
                                    Image(systemName: themeColor == 7 ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: geometry.size.height / 35, weight: .heavy))
                                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                                }
                                .frame(width: geometry.size.height / 8, height: geometry.size.height / 6)
                                
                                
                            
                            }
                            .frame(height: geometry.size.height / 6)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            
                        }
                        
                    }
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                    .foregroundStyle(colorScheme == .dark ? darkGray : lightGray)
                    

                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)

                
                
            }
            
            
        }
    }
}

#Preview {
    Settings(themeColor: .constant(7), iconColor: .constant(7))
}
