//
//  APLBasicSprites.swift
//  Sprite Tour
//
//  Created by Robert Linnemann on 12/12/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import SpriteKit

class APLBasicSprites: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        self.scaleMode = .aspectFit
        self.addTexturedSprite()
        self.addColoredSprite()
    }

    func addTexturedSprite() {
        // Creates a textured sprite and adds it to the scene. A label is added as a child of the sprite; if the sprite moves, the label moves with it.
        let sprite = SKSpriteNode(imageNamed: "rocket")
        
        sprite.position = CGPoint(x: self.frame.midX - 80.0, y: self.frame.midY)
        self.addChild(sprite)
        self.addDescription(NSLocalizedString("Texture Sprite", comment: ""), sprite: sprite)
    }
    
    func addColoredSprite() {
        // Creates a colored sprite and adds it to the scene. A label is added as a child of the sprite; if the sprite moves, the label moves with it.
        let sprite = SKSpriteNode(color: .red, size: CGSize(width: 128, height: 128))
        sprite.position = CGPoint(x: self.frame.midX + 80.0, y: self.frame.midY)
        self.addChild(sprite)
        self.addDescription(NSLocalizedString("Color Sprite", comment: ""), sprite: sprite)
    }
    
    func addDescription(_ description: String, sprite: SKSpriteNode) {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = description
        myLabel.fontSize = 18.0
        myLabel.position = CGPoint(x: 0, y: -sprite.size.height/2 - 30)
        sprite.addChild(myLabel)
    }

}
