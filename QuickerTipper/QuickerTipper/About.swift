//
//  About.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 6/3/24.
//

import SwiftUI

struct About: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
            
            
        }
    }
}

#Preview {
    About()
}
