//
//  ItemGridView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct ItemGridView: View {
    @State private var items = [""]
    @State private var showSafari = false
//    @State private var idx: Int
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let a = [URL(string: "https://blog.naver.com/miracle_jane/223167925701"), URL(string: "https://youtu.be/YXpZhLcItoU?si=C6MGJELIdG4RHB9x")]
    let b = ["https://postfiles.pstatic.net/MjAyMzA3MjdfMTIx/MDAxNjkwNDYwODczNjM1.wmIDoRVvopz78TEXg-ge71kHGT1KKOibNSDQM1aXPFQg.ofW1W9lvHEC5R8psgFyEctvLj1cjA5EnC-MSggLQWLEg.JPEG.miracle_jane/%ED%95%84%EB%A6%84%EC%B9%B4%EB%A9%94%EB%9D%BC%EC%82%AC%EC%9A%A9%EB%B2%95%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg?type=w966", "https://i.ytimg.com/vi/YXpZhLcItoU/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAQtLYTFCu6UzaRcij6VQFv-9iepQ"]
    var body: some View {
        VStack {
            NavigationLink(destination: MapView()) {
                Text("Featured Tips")
                    .font(.headline)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            
            LazyVGrid(columns: columns) {
                var selectedURL: URL?
                ForEach(0..<4) { index in
                    VStack {
                        AsyncImage(url: URL(string: b[index%2])) { image in
                            image
                                .resizable()
                                .frame(height: 200)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                
                                .onTapGesture {
                                    selectedURL = a[index % 2]
                                    showSafari = true
                                }
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .padding(.bottom)
                    .sheet(isPresented: $showSafari) {
                        SafariView(url: selectedURL!)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ItemGridView()
}
