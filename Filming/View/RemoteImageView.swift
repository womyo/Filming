//
//  RemoteImageView.swift
//  Filming
//
//  Created by 이인호 on 5/24/24.
//

import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var remoteImageViewModel: RemoteImageViewModel
    
    init(url: String) {
        remoteImageViewModel = RemoteImageViewModel(url: url)
    }
    
    var body: some View {
        if let image = remoteImageViewModel.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

#Preview {
    RemoteImageView(url: "")
}
