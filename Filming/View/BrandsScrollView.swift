//
//  BrandsScrollView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct BrandsScrollView: View {
    @State private var brands: [String: String] = [
        "Nikon": "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Nikon_Logo.svg/1024px-Nikon_Logo.svg.png",
        "Canon": "https://logowik.com/content/uploads/images/681_canon.jpg",
        "Minolta": "https://www.kindpng.com/picc/m/452-4527542_konica-minolta-logo-png-transparent-png.png",
        "Konica": "https://logowik.com/content/uploads/images/880_konica_logo.jpg",
        "Leica": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Leica_Camera_logo.svg/1200px-Leica_Camera_logo.svg.png",
        "Pentax": "https://logowik.com/content/uploads/images/pentax2262.jpg",
        "Olympus": "https://logos-world.net/wp-content/uploads/2023/03/Olympus-Logo-500x281.png",
        "Yashica": "https://logowik.com/content/uploads/images/yashica3867.logowik.com.webp"
    ]
    
    var body: some View {
        VStack {
            NavigationLink(destination: SceneKitView(modelName: "Minolta_X-300.usdz").frame(height: 400)) {
                Text("Film Camera Brands")
                    .font(.headline)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(brands.sorted { $0.key < $1.key }, id: \.key) { key, value in
                        VStack {
                            RemoteImageView(url: value)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.gray, lineWidth: 0.1)
                                )
                            Text(key)
                                .font(.caption)
                        }
                        .padding(.leading, key == brands.sorted { $0.key < $1.key }.first?.key ? 16 : 8)
                        .padding(.trailing, key == brands.sorted { $0.key < $1.key }.last?.key ? 16 : 8)
                    }
                }
            }
        }
    }
}

#Preview {
    BrandsScrollView()
}

