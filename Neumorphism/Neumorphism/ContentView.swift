//
//  ContentView.swift
//  Neumorphism
//
//  Created by Peter Khouly on 08/03/2020.
//  Copyright © 2020 Peter Khouly. All rights reserved.
//

import SwiftUI
import CoreHaptics


extension Color {
    static let offWhite = Color(red: 255 / 255, green: 255 / 255, blue: 235 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimpleButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .padding(30)
        .contentShape(Circle())
            .background(
                Group{
                    if configuration.isPressed {
                                                
                        Circle()
                            .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
        ZStack{
            Color.offWhite
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.offWhite)
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
            Text("Hello, World!").foregroundColor(.gray)
        }.edgesIgnoringSafeArea(.all)
            ZStack{
                Color.offWhite
                
                Button(action: {
                    print("button tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                }
            .buttonStyle(SimpleButtonStyle())
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
