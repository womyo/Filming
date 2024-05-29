//
//  CustomTabBarView.swift
//  Filming
//
//  Created by 이인호 on 5/29/24.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Tab
    let action: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                ForEach(Tab.allCases,id: \.self) { tab in
                    Spacer()
                    Button {
                        selectedTab = tab
                        action()
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: tab.rawValue)
                                .symbolVariant(.fill)
                                .imageScale(.large)
                            Text(tab.title)
                                .font(.caption)
                        }
                    }
                    .foregroundStyle(selectedTab == tab ? .blue : .secondary)
                    Spacer()
                }
            }
        }
    }
}
