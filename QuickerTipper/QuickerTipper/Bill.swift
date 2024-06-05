//
//  Bill.swift
//  QuickerTipper
//
//  Created by Kyle Schang on 6/4/24.
//

import SwiftUI



struct Bill: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @Binding var themeColor:Int
    
    var body: some View {
        
        ZStack {
            
            // Page Background
            Rectangle()
                .fill(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
            
            GeometryReader { FullPage in
                VStack() {
                    // Title
                    Text("Quicker Tipper")
                        .font(.system(size: FullPage.size.height / 30, weight: .heavy))
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .frame(height: FullPage.size.height / 30)
                        .minimumScaleFactor(0.20)
                    
                    // Divider
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(height: 3)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    
                    GeometryReader { Outputs in
                        VStack(spacing: 0) {
                            outputText(outputNumber: "$0.00", outputLabel: "Bill Amount", geometry: Outputs)
                            outputText(outputNumber: "$0.00", outputLabel: "Tip Amount (0%)", geometry: Outputs)
                            outputText(outputNumber: "$0.00", outputLabel: "Total Amount", geometry: Outputs)
                            
                        }
                        
                    }
                    .frame(height: FullPage.size.height / 4)
                    
                    // Divider
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(height: 3)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    
                    GeometryReader { InputsOne in
                        
                        
                        
                    }
                    .frame(height: FullPage.size.height / 7)
                    
                    // Divider
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(height: 3)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    
                    GeometryReader { InputsTwo in
                        
                        
                        
                    }
                    
                    
                }
                .padding(.horizontal, FullPage.size.width / 20)
            }
            
        }
        
        
    }
    
    @ViewBuilder
    private func outputText(outputNumber: String, outputLabel: String, geometry: GeometryProxy) -> some View {
        VStack {
            HStack{
                Spacer()
                Text(outputNumber)
                    .font(.system(size: geometry.size.height / 5 , weight: .heavy))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .frame(height: geometry.size.height / 3, alignment: .trailing)
                    .minimumScaleFactor(0.20)
            }
        }
    }
    
    
}

#Preview {
    Bill(themeColor: .constant(1))
}
