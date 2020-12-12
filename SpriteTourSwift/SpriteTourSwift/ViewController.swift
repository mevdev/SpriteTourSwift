//
//  ViewController.swift
//  Sprite Tour
//
//  Created by Robert Linnemann on 12/12/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import SpriteKit

class ViewController: UIViewController {
    
    var indexSelected: Int = 0
    var sceneTitle: String = ""
    
    override func viewDidLoad() {
        self.title = sceneTitle
        super.viewDidLoad()
        let skView = SKView()
        self.view.addSubview(skView)
        skView.translatesAutoresizingMaskIntoConstraints = false
        skView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        skView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        skView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        let scene = drawScene(self.view.bounds.size)

        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        
        skView.showsFPS = true
        skView.showsNodeCount = true
    }
    
    func drawScene(_ size: CGSize) -> SKScene {
        switch self.indexSelected {
        case 0: return APLBasicSprites(size: size)
        case 1: return APLColorizedSprites(size: size)
        case 2: return ColorizedAnimatingSprite(size: size)
        default: return APLBasicSprites(size: size)
        }
        
//            case 3:
//                scene = [APLResizingSprites sceneWithSize:size];
//                break;
//
//            case 4:
//                scene = [APLSpriteAnchors sceneWithSize:size];
//                break;
//
//            case 5:
//                scene = [APLBlendingSprites sceneWithSize:size];
//                break;
//
//            case 6:
//                scene = [APLAnimatingSprites sceneWithSize:size];
//                break;
//
//            default:
//                break;
//        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
