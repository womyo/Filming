//
//  HomeView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            BrandsScrollView()
            Spacer()
            ItemGridView()
                .searchable(text: $searchText,
                            placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "Search")
                .textInputAutocapitalization(.never)
                .navigationTitle("Filming")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
