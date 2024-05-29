//
//  HomeView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 30) {
                    CarouselAdsView()
                    BrandsScrollView(path: $path)
                    TipsGridView()
                }
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search")
            .textInputAutocapitalization(.never)
            .navigationTitle("Filming")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
        }
    }
}

//#Preview {
//    HomeView()
//}
