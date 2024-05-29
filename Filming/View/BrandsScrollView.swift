//
//  BrandsScrollView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct BrandsScrollView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            NavigationLink(value: "Brands") {
                HStack {
                    Text("Film Camera Brands")
                        .font(.headline)
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }
            }
            .navigationDestination(for: String.self) { destination in
                BrandsGridView(path: $path)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(Camera.cameras, id: \.self) { camera in
                        NavigationLink(destination: BrandDetailView(camera: camera)) {
                            VStack {
                                RemoteImageView(url: camera.logoImage)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.gray, lineWidth: 0.1)
                                    )
                                Text(camera.brand)
                                    .font(.caption)
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding(.leading, camera == Camera.cameras.first ? 16 : 8)
                        .padding(.trailing, camera == Camera.cameras.last ? 16 : 8)
                    }
                }
            }
        }
    }
}

//#Preview {
//    BrandsScrollView()
//}

