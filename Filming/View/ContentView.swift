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
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            MapView()
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
