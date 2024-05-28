//
//  CarouselAdsView.swift
//  Filming
//
//  Created by 이인호 on 5/24/24.
//

import SwiftUI

struct CarouselAdsView: View {
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var index = 0
    @State private var selected: String = ""
    private let imageNames: [String] = [
        "https://vintagecameradigest.com/wp-content/uploads/2021/03/minolta-1960.jpg?w=2046",
        "https://flexible.img.hani.co.kr/flexible/normal/590/234/imgdb/resize/2007/1002/119128907352_20071002.jpg",
        "https://dimg.donga.com/wps/NEWS/IMAGE/2023/11/29/122399819.1.jpg"
    ]
    
    var body: some View {
        TabView(selection: $selected) {
            ForEach(imageNames, id: \.self) { image in
                RemoteImageView(url: image)
            }
        }
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal)
        .tabViewStyle(.page)
        .onReceive(timer, perform: { _ in
            withAnimation {
                index = (index + 1) % imageNames.count
                selected = imageNames[index]
            }
        })
    }
}

#Preview {
    CarouselAdsView()
}
