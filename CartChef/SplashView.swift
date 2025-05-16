// SplashView.swift
import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var logoOpacity = 0.0
    @State private var logoScale: CGFloat = 0.8

    var body: some View {
        if isActive {
            ContentView() // 👈 Not HomeView directly!
        } else {
            VStack {
                Spacer()
                Image("AppLogo") // your logo asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .opacity(logoOpacity)
                    .scaleEffect(logoScale)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.0)) {
                            logoOpacity = 1.0
                            logoScale = 1.0
                        }
                    }
                Spacer()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

