//
//  BrandDetailView.swift
//  Filming
//
//  Created by 이인호 on 5/29/24.
//

import SwiftUI

struct TabBarVisibilityKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(true)
}

extension EnvironmentValues {
    var isTabBarVisible: Binding<Bool> {
        get { self[TabBarVisibilityKey.self] }
        set { self[TabBarVisibilityKey.self] = newValue }
    }
}

struct TabBarHiddenModifier: ViewModifier {
    @Environment(\.isTabBarVisible) var isTabBarVisible: Binding<Bool>

    func body(content: Content) -> some View {
        content
            .onAppear {
                isTabBarVisible.wrappedValue = false
            }
            .onDisappear {
                isTabBarVisible.wrappedValue = true
            }
    }
}

extension View {
    func hideTabBar() -> some View {
        self.modifier(TabBarHiddenModifier())
    }
}

struct BrandDetailView: View {
    var camera: Camera
    
    var body: some View {
        VStack {
            SceneKitView(modelName: camera.model3D)
                .frame(height: 400)
        }
        .hideTabBar()
    }
}

//#Preview {
//    BrandDetailView()
//}
