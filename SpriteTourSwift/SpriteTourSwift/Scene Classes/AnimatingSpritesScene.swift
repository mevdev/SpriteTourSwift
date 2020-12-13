//
//  AnimatingSpritesScene.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import SpriteKit

class AnimatingSpritesScene: SKScene {
    
    let kDefaultNumberOfWalkFrames = 28
    let showCharacterFramesOverOneSecond = 1.0 / 28.0
    
    var walkFrames: [SKTexture] {
        var frames = [SKTexture]()
        for i in 1...kDefaultNumberOfWalkFrames {
            frames.append(SKTexture(imageNamed: "warrior_walk_\(String(format: "%04d", i))"))
        }
        return frames
    }
    
    override func didMove(to view: SKView) {
        // Create the sprite with the initial frame.
        let sprite = SKSpriteNode(texture: self.walkFrames.first)
        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(sprite)
        
        // Cycle through the frames.
        let animateFramesAction = SKAction.animate(with: self.walkFrames, timePerFrame: showCharacterFramesOverOneSecond, resize: false, restore: false)
        sprite.run(SKAction.repeatForever(animateFramesAction))
        self.addSceneDescriptionLabel()
    }

    func addSceneDescriptionLabel() {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = NSLocalizedString("Animating through a series of images.", comment: "")
        myLabel.fontSize = 18.0
        myLabel.position = CGPoint(x: self.frame.midX, y: 100.0)
        self.addChild(myLabel)
    }
}
