//
//  ColorizedAnimatingSpriteScene.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import SpriteKit

class ColorizedAnimatingSpriteScene: SKScene {
    
    var spriteTemplate: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        self.scaleMode = .aspectFit
        
        // Allocate a single sprite and copy it to make the other sprites.
        let sprite = SKSpriteNode(imageNamed: "rocket")
        sprite.setScale(0.5)
        self.spriteTemplate = sprite
        self.addAnimatedSprite()
    }
    
    func addAnimatedSprite() {
        // Adds a sprite to the scene, and animates its blend color.
        if let animatedSprite = self.spriteTemplate?.copy() as? SKSpriteNode {
            animatedSprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            self.addChild(animatedSprite)
            animatedSprite.run(self.animateColorsAction())
            // Label the sprite.
            // Normally, this would be attached to the sprite. But in this scene, the sprite is scaled to 50%, so the label would be too. So instead, the sprite's position is calculated in the scene and placed there.
            let myLabel = SKLabelNode(fontNamed: "Helvetica")
            myLabel.text = NSLocalizedString("Animated Color Blending", comment: "");
            myLabel.fontSize = 14.0
            myLabel.position = CGPoint(x: animatedSprite.position.x, y: animatedSprite.position.y - 90)
            self.addChild(myLabel)
        }
    }
    
    func animateColorsAction() -> SKAction {
        // Creates and returns an action sequence that animates a sprite's blend color.
        let sequence = SKAction.sequence([
            SKAction.wait(forDuration: 1.0),
            SKAction.colorize(with: .red, colorBlendFactor: 1.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.colorize(with: .green, colorBlendFactor: 1.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.colorize(with: .blue, colorBlendFactor: 1.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.colorize(with: .yellow, colorBlendFactor: 1.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.colorize(withColorBlendFactor: 0.0, duration: 1.0)
        ])
        return SKAction.repeatForever(sequence)
    }

}
