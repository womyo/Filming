//
//  TabBarViewModel.swift
//  Filming
//
//  Created by 이인호 on 5/28/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house"
    case map = "map"
    case rent = "camera"
    case my = "face.smiling"
}

extension Tab {
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .map:
            return "현상소"
        case .rent:
            return "대여"
        case .my:
            return "내 정보"
        }
    }
}
