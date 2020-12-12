//
//  ColorizedAnimatingSpritesScene.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import SpriteKit

class ColorizedSpritesScene: SKScene {
    
    var spriteTemplate: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        self.scaleMode = .aspectFit
        
        // Allocate a single sprite and copy it to make the other sprites.
        let sprite = SKSpriteNode(imageNamed: "rocket")
        sprite.setScale(0.3)
        self.spriteTemplate = sprite
        
        self.addBlendFactorLabels()
        
        // Add rows of sprites for a different colors.
        self.addColor(.red,     toRow: 0)
        self.addColor(.green,   toRow: 1)
        self.addColor(.blue,    toRow: 2)
        self.addColor(.yellow,  toRow: 3)
 
    }
    
    func addBlendFactorLabels() {
        // Adds a series of labels to the scene to identify how much color is being added to each sprite. (The labels are aligned with the color rows).
        let descriptionLabel = SKLabelNode(fontNamed: "Helvetica")
        descriptionLabel.fontSize = 18.0
        descriptionLabel.text = NSLocalizedString("Color blend factor:", comment: "")
        descriptionLabel.horizontalAlignmentMode = .left
        descriptionLabel.position = CGPoint(x: 80.0, y: self.frame.maxY - 82.0)
        self.addChild(descriptionLabel)
        
        for i in 0...3 {
            let numberLabel = SKLabelNode(fontNamed: "Helvetica")
            numberLabel.text = "\(Double(i)/4.0)"
            numberLabel.fontSize = 18
            let templateWidth = self.spriteTemplate?.size.width ?? 0
            numberLabel.position = CGPoint(x: 100.0 + CGFloat(i) * (templateWidth + 18),y: self.frame.maxY - 105)
            self.addChild(numberLabel)
        }
    }
    
    func addColor(_ color: SKColor, toRow row: Int) {
        // Adds a row of sprites to the scene, showing how a sprite is affected by the blended color.
        let templateWidth = self.spriteTemplate?.size.width ?? 0
        let templateHeight = self.spriteTemplate?.size.height ?? 0
        for i in 0...3 {
            if let s = self.spriteTemplate?.copy() as? SKSpriteNode {
                s.color = color
                s.colorBlendFactor = 0.25 * CGFloat(i);
                s.position = CGPoint(x: 100.0 + CGFloat(i) * (templateWidth + 18.0), y: 57.0 + CGFloat(row) * templateHeight)
                self.addChild(s)
            }
        }
            
        // And a simple color node to show the actual blend color.
        let colorSwash = SKSpriteNode(color: color, size: CGSize(width: 20.0, height: 90.0))
        colorSwash.position = CGPoint(x: self.frame.midX * 1.80, y: 65.0 + CGFloat(row) * templateHeight)
        self.addChild(colorSwash)
    }

}
