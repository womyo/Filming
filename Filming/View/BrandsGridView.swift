//
//  GridView.swift
//  Filming
//
//  Created by 이인호 on 5/28/24.
//

import SwiftUI

struct BrandsGridView: View {
    @Binding var path: NavigationPath

    let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(Camera.cameras, id: \.self) { camera in
                    NavigationLink(destination: BrandDetailView(camera: camera)) {
                        ZStack {
                            RemoteImageView(url: camera.mainImage)
                                .frame(height: 200)
                                .aspectRatio(contentMode: .fit)
                            Text(camera.brand)
                                .tracking(1)
                                .font(.system(size: 24, weight: .semibold, design: .serif))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        .navigationTitle("Brands")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    BrandsGridView()
//}
