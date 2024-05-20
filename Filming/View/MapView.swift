//
//  MapView.swift
//  Filming
//
//  Created by 이인호 on 5/21/24.
//

import SwiftUI

struct MapView: View {
    @StateObject var coordinator: Coordinator = Coordinator.shared
    
    var body: some View {
        ZStack {
            VStack {
                NaverMap()
                    .ignoresSafeArea(.all, edges: .top)
            }
        }
        .onAppear {
            Coordinator.shared.checkLocationAuthorization()
        }
    }
}

#Preview {
    MapView()
}
