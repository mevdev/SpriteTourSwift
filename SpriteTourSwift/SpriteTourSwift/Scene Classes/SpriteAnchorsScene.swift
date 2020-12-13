//
//  SpriteAnchorsScene.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import SpriteKit

class SpriteAnchorsScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.addAnchorGrid()
        self.addAnimatedAnchor()
        self.addSceneDescriptionLabel()
    }
    
    func addAnchorGrid() {
        // Creates a 2-dimensional grid of sprites, each with a different anchor point. It shows how a sprite's image moves when the anchor point changes.
        for x in 0...4 {
            for y in 0...4 {
                let xFloat = CGFloat(x)
                let yFloat = CGFloat(y)
                let sprite = SKSpriteNode(imageNamed: "rocket")
                sprite.setScale(0.15)
                sprite.anchorPoint = CGPoint(x: 0.25 * xFloat, y: 0.25 * yFloat)
                sprite.position = CGPoint(x: self.frame.midX - 110 + (24.0 * xFloat), y: self.frame.midY - 55.0 + (50.0 * yFloat))
                self.addChild(sprite)
                self.addAnchorDotToSprite(sprite)
            }
        }
    }
    
    func addAnchorDotToSprite(_ sprite: SKSpriteNode) {
        let dot = SKShapeNode()
        
        let myPath = CGMutablePath()
        myPath.addArc(center: CGPoint(x:0, y:0), radius: 10, startAngle: 0, endAngle: CGFloat(M_2_PI), clockwise: true, transform: .identity)
        
        dot.path = myPath
        dot.fillColor = .blue
        dot.lineWidth = 0.0
        sprite.addChild(dot)
    }
    
    func addAnimatedAnchor() {
        // Creates a sprite and animates its anchor point.
        let animatedSprite = SKSpriteNode(imageNamed: "rocket")
        animatedSprite.setScale(0.5)
        animatedSprite.position = CGPoint(x: self.frame.midX + 80.0, y: self.frame.midY)
        animatedSprite.anchorPoint = CGPoint.zero
        self.addChild(animatedSprite)
        self.addAnchorDotToSprite(animatedSprite)
        animatedSprite.run(self.animatedAnchorAction)
    }
    
    var animatedAnchorAction: SKAction {
        // Normally, you can't directly animate an anchor point, but you can build a custom action to so do. This method builds a bunch of custom actions, then combines them in a repeating sequence.
        let moveAnchorRight = SKAction.customAction(withDuration: 1.0) { (node, elapsedTime) in
            (node as? SKSpriteNode)?.anchorPoint = CGPoint(x: elapsedTime, y: 0.0)
        }
        let moveAnchorUp = SKAction.customAction(withDuration: 1.0) { (node, elapsedTime) in
            (node as? SKSpriteNode)?.anchorPoint = CGPoint(x: 1.0, y: elapsedTime)
        }
        let moveAnchorLeft = SKAction.customAction(withDuration: 1.0) { (node, elapsedTime) in
            (node as? SKSpriteNode)?.anchorPoint = CGPoint(x: 1.0 - elapsedTime, y: 1.0)
        }
        let moveAnchorDown = SKAction.customAction(withDuration: 1.0) { (node, elapsedTime) in
            (node as? SKSpriteNode)?.anchorPoint = CGPoint(x: 0.0, y: 1.0 - elapsedTime)
        }
        let sequence = SKAction.sequence([moveAnchorRight, moveAnchorUp, moveAnchorLeft, moveAnchorDown])
        return SKAction.repeatForever(sequence)
    }
    func addSceneDescriptionLabel() {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = NSLocalizedString("The dots mark the actual position", comment: "")
        myLabel.fontSize = 18.0
        myLabel.position = CGPoint(x: self.frame.midX, y: 70.0)
        self.addChild(myLabel)
        
        let nextLabel = SKLabelNode(fontNamed: "Helvetica")
        nextLabel.text = NSLocalizedString("The dots mark the actual position", comment: "")
        nextLabel.fontSize = 18.0
        nextLabel.position = CGPoint(x: self.frame.midX, y: 50.0)
        self.addChild(nextLabel)
    }

//
//    - (SKAction *)newAnimateAnchorAction
//    {
//        // Normally, you can't directly animate an anchor point, but you can build a custom action to so do.
//        // This method builds a bunch of custom actions, then combines them in a repeating sequence.
//
//        SKAction *moveAnchorRight = [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//            SKSpriteNode *sprite = (SKSpriteNode*) node;
//            sprite.anchorPoint = CGPointMake(elapsedTime,0.0);
//        }];
//
//        SKAction *moveAnchorUp = [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//            SKSpriteNode *sprite = (SKSpriteNode*) node;
//            sprite.anchorPoint = CGPointMake(1.0,elapsedTime);
//        }];
//
//        SKAction *moveAnchorLeft = [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//            SKSpriteNode *sprite = (SKSpriteNode*) node;
//            sprite.anchorPoint = CGPointMake(1.0-elapsedTime,1.0);
//        }];
//
//        SKAction *moveAnchorDown = [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//            SKSpriteNode *sprite = (SKSpriteNode*) node;
//            sprite.anchorPoint = CGPointMake(0,1.0-elapsedTime);
//        }];
//
//        SKAction *sequence = [SKAction sequence:@[moveAnchorRight, moveAnchorUp, moveAnchorLeft, moveAnchorDown]];
//        return [SKAction repeatActionForever:sequence];
//    }

}
