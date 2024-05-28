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
    let imageURL: String
    let model3D: String
    
    static var cameras: [Camera] = [
        Camera(brand: "Nikon", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Nikon_Logo.svg/1024px-Nikon_Logo.svg.png", model3D: ""),
        Camera(brand: "Canon", imageURL: "https://logowik.com/content/uploads/images/681_canon.jpg", model3D: "Canon_AE-1.usdz"),
        Camera(brand: "Minolta", imageURL: "https://www.kindpng.com/picc/m/452-4527542_konica-minolta-logo-png-transparent-png.png", model3D: "Minolta_X-300.usdz"),
        Camera(brand: "Konica", imageURL: "https://logowik.com/content/uploads/images/880_konica_logo.jpg", model3D: "Konica_c35.usdz"),
        Camera(brand: "Leica", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Leica_Camera_logo.svg/1200px-Leica_Camera_logo.svg.png", model3D: "Leica_M6.usdz"),
        Camera(brand: "Pentax", imageURL: "https://logowik.com/content/uploads/images/pentax2262.jpg", model3D: "PENTAX_K1000.usdz"),
        Camera(brand: "Olympus", imageURL: "https://logos-world.net/wp-content/uploads/2023/03/Olympus-Logo-500x281.png", model3D: "Olympus_PBR.usdz"),
        Camera(brand: "Yashica", imageURL: "https://logowik.com/content/uploads/images/yashica3867.logowik.com.webp", model3D: "Yashica_FX3.usdz"),
    ]
}
