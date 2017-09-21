//
//  MaskedMaterial.swift
//  SceneKitTransparentVideo
//
//  Created by Turkowski on 21/09/2017.
//  Copyright © 2017 Turkowski. All rights reserved.
//

import SceneKit

public class MaskedMaterial: SCNMaterial {
    
    // MARK: - Initialization
    
    public init(transparencyMask: Any) {
        super.init()
        
        // black is fully opaque; white is transparent
        let surfaceShader =
        """
        _surface.transparent.a = 1 - _surface.transparent.r; 
        """

        shaderModifiers = [
            .surface: surfaceShader,
        ]
        
        transparent.contents = transparencyMask
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
