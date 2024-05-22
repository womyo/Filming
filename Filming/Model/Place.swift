//
//  Place.swift
//  Filming
//
//  Created by 이인호 on 5/21/24.
//

import Foundation

struct Place: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let lat: Double
    let lng: Double
}
