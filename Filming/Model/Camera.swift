//
//  Camera.swift
//  Filming
//
//  Created by 이인호 on 5/28/24.
//

import Foundation

struct Camera: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    let brand: String
    let logoImage: String
    let mainImage: String
    let model3D: String
    
    static var cameras: [Camera] = [
        Camera(brand: "Nikon", logoImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Nikon_Logo.svg/1024px-Nikon_Logo.svg.png", 
               mainImage: "https://i.pinimg.com/originals/4b/ba/5a/4bba5a7998c3454071a60158791f8a68.jpg", model3D: ""),
        Camera(brand: "Canon", logoImage: "https://logowik.com/content/uploads/images/681_canon.jpg",
               mainImage: "https://kamerastore.com/cdn/shop/articles/1_-_CanAE-1P-1.jpg?v=1701771040", model3D: "Canon_AE-1.usdz"),
        Camera(brand: "Leica", logoImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Leica_Camera_logo.svg/1200px-Leica_Camera_logo.svg.png",
               mainImage: "https://c1.wallpaperflare.com/preview/555/863/632/leica-camera-studio-film.jpg", model3D: "Leica_M6.usdz"),
        Camera(brand: "Minolta", logoImage: "https://www.kindpng.com/picc/m/452-4527542_konica-minolta-logo-png-transparent-png.png",
               mainImage: "https://cdn.assets.lomography.com/e0/e8bce51b1ca380143146fea7abdaec4e78dd9d/640x424x1.jpg?auth=b92b82c93e2520de6f5bb6404ed0dc1dd6b50e74", model3D: "Minolta_X-300.usdz"),
        Camera(brand: "Pentax", logoImage: "https://logowik.com/content/uploads/images/pentax2262.jpg",
               mainImage: "https://t4.ftcdn.net/jpg/06/81/71/75/360_F_681717512_z86Xt07ajy6mOAfvUUcA00F9mIqrRC6U.jpg", model3D: "PENTAX_K1000.usdz"),
        Camera(brand: "Olympus", logoImage: "https://logos-world.net/wp-content/uploads/2023/03/Olympus-Logo-500x281.png",
               mainImage: "https://vintagecameradigest.com/wp-content/uploads/2017/07/mg_9221.jpg", model3D: "Olympus_OM-1.usdz"),
        Camera(brand: "Konica", logoImage: "https://logowik.com/content/uploads/images/880_konica_logo.jpg",
               mainImage: "https://c4.wallpaperflare.com/wallpaper/464/786/416/background-camera-konica-c35-ef-wallpaper-preview.jpg", model3D: "Konica_c35.usdz"),
        Camera(brand: "Yashica", logoImage: "https://logowik.com/content/uploads/images/yashica3867.logowik.com.webp",
               mainImage: "https://kamerastore.com/cdn/shop/articles/FX3-1_1c0fd219-2160-4f41-b67f-88565e616eb0.jpg?v=1698745072", model3D: "Yashica_FX3.usdz")
    ]
}
