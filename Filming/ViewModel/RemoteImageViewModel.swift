//
//  RemoteImageViewModel.swift
//  Filming
//
//  Created by 이인호 on 5/24/24.
//

import SwiftUI

// 이미지 캐시에 저장
class ImageCache {
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}

class RemoteImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    private var url: String
    private var task: URLSessionDataTask?
    
    init(url: String) {
        self.url = url
        loadImage()
    }
    
    private func loadImage() {
        if let cachedImage = ImageCache.shared.get(forKey: url) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: url) else { return }
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
                ImageCache.shared.set(image!, forKey: self.url)
            }
        }
        task?.resume()
    }
    
    deinit {
        task?.cancel()
    }
}
