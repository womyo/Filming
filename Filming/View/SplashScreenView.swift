//
//  SplashScreenView.swift
//  Filming
//
//  Created by 이인호 on 5/20/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            MainView()
//                .onAppear {
//                    placeViewModel.initData()
//                }
        } else {
            ZStack {
                Color(UIColor(red: 0.95, green: 0.92, blue: 0.85, alpha: 1.0)).ignoresSafeArea()
                VStack {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Filming")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.gray)
                        .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
