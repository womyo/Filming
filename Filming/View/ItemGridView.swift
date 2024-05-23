//
//  ItemGridView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct ItemGridView: View {
    @State private var items = [""]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<3) { item in
                VStack {
                    AsyncImage(url: URL(string: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202204/14/c57630bb-77da-4d7b-812f-7acdf1b905ab.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    } placeholder: {
                        ProgressView()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ItemGridView()
}
