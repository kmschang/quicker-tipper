//
//  Settings.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 6/1/24.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
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
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 20)
                        .font(.system(size: geometry.size.height/25, weight: .heavy))
                        .minimumScaleFactor(0.20)
                    
                    // Spacer
                    Rectangle()
                        .fill(colorScheme == .dark ? .white : .black)
                        .frame(height: 3)
                    
                }
                .padding(.horizontal, 20)

                
                
            }
            
            
        }
    }
}

#Preview {
    Settings()
}
