//
//  NaverMap.swift
//  Filming
//
//  Created by 이인호 on 5/21/24.
//

import SwiftUI
import NMapsMap

struct NaverMap: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator.shared
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        context.coordinator.getNaverMapView()
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        
    }
}

#Preview {
    NaverMap()
}
