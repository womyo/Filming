//
//  ContentView.swift
//  Filming
//
//  Created by 이인호 on 5/20/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .home
    @State private var isTabBarVisible = true
    @State private var path = NavigationPath()
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView(path: $path)
                    .toolbar(isTabBarVisible ? .automatic : .hidden, for: .tabBar)
                    .tag(Tab.home)
                MapView()
                    .tag(Tab.map)
                Text("c")
                    .tag(Tab.rent)
                Text("d")
                    .tag(Tab.my)
            }
            .environment(\.isTabBarVisible, $isTabBarVisible)
            
            if isTabBarVisible {
                CustomTabBarView(selectedTab: $selectedTab) {
                    if selectedTab == .home {
                        path = NavigationPath()
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
