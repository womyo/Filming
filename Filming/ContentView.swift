//
//  ContentView.swift
//  Filming
//
//  Created by 이인호 on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SceneKitView(modelName: "Minolta_X-300.usdz")
                .frame(height: 400)
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            Text("b")
                .tabItem {
                    Label("현상소", systemImage: "map")
                }
            Text("c")
                .tabItem {  
                    Label("대여", systemImage: "camera")
                }
            Text("d")
                .tabItem {
                    Label("커뮤니티", systemImage: "person.3")
                }
            Text("e")
                .tabItem {
                    Label("내 정보", systemImage: "face.smiling")
                }
        }
    }
}

#Preview {
    ContentView()
}
