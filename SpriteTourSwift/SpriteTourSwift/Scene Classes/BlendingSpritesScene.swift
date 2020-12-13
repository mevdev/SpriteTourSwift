//
//  BlendingSpritesScene.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import SpriteKit

class BlendingSpritesScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.addSceneDescriptionLabel()
        self.run(addLightAction)
    }
    
    var addLightAction: SKAction {
        let sequence = SKAction.sequence([
            SKAction.perform(#selector(addLight), onTarget: self),
            SKAction.wait(forDuration: 0.5, withRange: 0.1)
        ])
        return SKAction.repeatForever(sequence)
    }
    
    @objc func addLight() {
        // Create a new light and add it to the scene. The light uses an additive blend mode.
        let sprite = SKSpriteNode(imageNamed: "spark")
        sprite.position = CGPoint(x: myRand(low: -150.0, high: 150.0) + self.frame.midX, y: myRand(low: -150.0, high: 150.0) + self.frame.midY)
        sprite.blendMode = .add
        // these values were chosen only for the aesthetic effect.
        sprite.alpha = 0.5
        sprite.setScale(2.0)
        self.addChild(sprite)
    }
    
    func addSceneDescriptionLabel() {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = NSLocalizedString("These textured sprite nodes are", comment: "")
        myLabel.fontSize = 18.0
        myLabel.position = CGPoint(x: self.frame.midX, y: 120.0)
        self.addChild(myLabel)
        
        let nextLabel = SKLabelNode(fontNamed: "Helvetica")
        nextLabel.text = NSLocalizedString("combined using an additive blend.", comment: "")
        nextLabel.fontSize = 18.0
        nextLabel.position = CGPoint(x: self.frame.midX, y: 100.0)
        self.addChild(nextLabel)
    }


// MARK: Useful random functions

    func myRandf() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(RAND_MAX)
    }

    func myRand(low: CGFloat, high: CGFloat) -> CGFloat {
        return myRandf() * (high - low) + low;
    }
}
