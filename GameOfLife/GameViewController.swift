//
//  GameViewController.swift
//  GameOfLife
//
//  Created by Ufuk Türközü on 27.07.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var genarationLabel: UILabel!
    @IBOutlet weak var gridView: SKView!
    @IBOutlet weak var preset1Button: UIButton!
    @IBOutlet weak var preset2Button: UIButton!
    @IBOutlet weak var preset3Button: UIButton!
    @IBOutlet weak var preset4Button: UIButton!
    
    // MARK: - Properties
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the view
        gridView.isMultipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: gridView.bounds.size)
        scene.scaleMode = .aspectFill
        
        // Present the scene.
        gridView.presentScene(scene)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
