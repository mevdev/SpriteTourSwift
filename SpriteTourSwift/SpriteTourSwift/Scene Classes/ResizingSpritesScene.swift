//
//  ResizingSpritesScene.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import SpriteKit

class ResizingSpritesScene: SKScene {
    
    var spriteTemplate: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        // Creates a pair of sprites. One uses the default scaling behavior, and the other uses a custom center rect. The corners of the UI button are a fixed size, and the remaining part of the texture is scaled.
        self.backgroundColor = .black
        self.scaleMode = .aspectFit

        let texture = SKTexture(imageNamed: "stretchable_image")
        let resizeSpritesAction: SKAction = self.resizeSpriteAction(texture)
        
        let defaultSprite = SKSpriteNode(texture: texture)
        defaultSprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 125.0)
        self.addChild(defaultSprite)
        defaultSprite.run(resizeSpritesAction)
        self.addDescription(NSLocalizedString("Resized with default stretching", comment: ""), toSprite: defaultSprite)

        let customSprite = SKSpriteNode(texture: texture)
        customSprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 70.0)
        // the center rect calculation is always based on the artwork. In this case the artwork is a 28 x 28 pixel image with a 4 x 4 pixel stretchable center.
        customSprite.centerRect = CGRect(x: 12.0/28.0, y: 12.0/28.0, width: 4.0/28.0, height: 4.0/28.0)
        self.addChild(customSprite)
        customSprite.run(resizeSpritesAction)
        self.addDescription("Resized with custom stretching", toSprite: customSprite)
    }
    
    func resizeSpriteAction(_ texture: SKTexture) -> SKAction {
        // Creates and returns an action sequence that resizes a sprite through a variety of sizes. It then returns the sprite back to its normal default size.
        let sequence = SKAction.sequence([
            SKAction.wait(forDuration: 1.0),
            SKAction.resize(toWidth: 192.0, height: 192.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.resize(toWidth: 128.0, height: 192.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.resize(toWidth: 256.0, height: 128.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.resize(toWidth: texture.size().width, height: texture.size().height, duration: 1.0)
        ])
        return SKAction.repeatForever(sequence)
    }

    func addDescription(_ description: String, toSprite sprite: SKSpriteNode) {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = description
        myLabel.fontSize = 18.0
        myLabel.position = CGPoint(x: 0.0, y: 0.0)
        sprite.addChild(myLabel)
    }

}
