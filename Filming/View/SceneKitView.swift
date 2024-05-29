//
//  SceneKitView.swift
//  Filming
//
//  Created by 이인호 on 5/20/24.
//

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    var modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        if let scene = SCNScene(named: modelName) {
            if let node = scene.rootNode.childNodes.first {
                node.eulerAngles = SCNVector3(0, 0, 0)
            }
            scnView.scene = scene
        } else {
            print("Error: Could not load the 3D model named \(modelName)")
        }
        
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}

#Preview {
    SceneKitView(modelName: "")
}
