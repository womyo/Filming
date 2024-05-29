//
//  ItemGridView.swift
//  Filming
//
//  Created by 이인호 on 5/23/24.
//

import SwiftUI

struct TipsGridView: View {
    @State private var items = [""]
    @State private var showSafari = false
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text("Featured Tips")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns) {
                var selectedURL: URL?
                ForEach(0..<4) { index in
                    VStack {
                        AsyncImage(url: URL(string: linkMockData[index%2])) { image in
                            image
                                .resizable()
                                .frame(height: 200)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                
                                .onTapGesture {
                                    selectedURL = urlMockData[index % 2]
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
    TipsGridView()
}
