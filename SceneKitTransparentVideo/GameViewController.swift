//
//  GameViewController.swift
//  SceneKitTransparentVideo
//
//  Created by Turkowski on 20/09/2017.
//  Copyright © 2017 Turkowski. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit

final class GameViewController: UIViewController {
    
    // MARK: - Private properties
    
    // MARK: - Outlets
    
    @IBOutlet private var sceneView: SCNView!
    
    // MARK: - Scene
    
    private lazy var scene = self.sceneView.scene!
    private lazy var plane1 = self.scene.rootNode.childNode(withName: "plane1", recursively: true)!
    private lazy var plane2 = self.scene.rootNode.childNode(withName: "plane2", recursively: true)!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoContent()
    }
    
    // MARK: - Private properties
    
    private func setupVideoContent() {
        
        // chroma key
        
        let chromaKeyContent = VideoContent(filename: "chromakeyfootage.mp4",
                                            size: CGSize(width: 480, height: 640))
        
        let chromaKeyMaterial = ChromaKeyMaterial()
        chromaKeyMaterial.diffuse.contents = chromaKeyContent
        plane1.geometry!.materials = [chromaKeyMaterial]
        
        // transparency mask
        
        let maskedContent = VideoContent(filename: "opaquefootage.mp4",
                                         size: CGSize(width: 480, height: 640))
        
        let transparencyMask = VideoContent(filename: "transparencymask.mp4",
                                            size: CGSize(width: 480, height: 640))
        
        let maskedMaterial = MaskedMaterial(transparencyMask: transparencyMask)
        maskedMaterial.diffuse.contents = maskedContent
        plane2.geometry!.materials = [maskedMaterial]
    }
}


