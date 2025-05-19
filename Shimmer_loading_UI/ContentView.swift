//
//  ContentView.swift
//  Shimmer_loading_UI
//
//  Created by Shaan on 16/05/25.
//

import SwiftUI

struct GroceryShimmerView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .shimmerEffect(isAnimating: isAnimating)
                .frame(height: 50)
                .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2), spacing: 15) {
                    ForEach(0..<6, id: \.self) { _ in
                        VStack(spacing: 8) {
                           
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                                .shimmerEffect(isAnimating: isAnimating)
                                .frame(height: 140)
                            
                          
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                                .shimmerEffect(isAnimating: isAnimating)
                                .frame(height: 20)
                            
                          
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                                .shimmerEffect(isAnimating: isAnimating)
                                .frame(height: 20)
                            
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                                .shimmerEffect(isAnimating: isAnimating)
                                .frame(height: 40)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            isAnimating.toggle()
        }
    }
}


extension View {
    func shimmerEffect(isAnimating: Bool) -> some View {
        self.overlay(
            LinearGradient(
                gradient: Gradient(colors: [.white.opacity(0.4), .white.opacity(0.8), .white.opacity(0.4)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .mask(
                RoundedRectangle(cornerRadius: 8)
                    .blur(radius: 8) // Soft glow effect
            )
            .opacity(isAnimating ? 1.0 : 0.6) // Pulsating glow
                .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: isAnimating)
        )
    }
}

struct ContentView: View {
    var body: some View {
        GroceryShimmerView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
