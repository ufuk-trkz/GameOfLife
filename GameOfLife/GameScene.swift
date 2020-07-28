//
//  GameScene.swift
//  GameOfLife
//
//  Created by Ufuk Türközü on 27.07.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    private var tiles = Array2D<Cell>(columns: 8, rows: 8)
    
    override func didMove(to view: SKView) {
        self.scaleMode = .resizeFill
        
        // Draw the board
        drawBoard()
        // Add a game piece to the board
    }
    
    func drawBoard() {
        // Board parameters
        let numRows = 20
        let numCols = 20
        let squareSize = CGSize(width: Int(size.width)/numRows, height: Int(size.height)/numCols)
        // Column characters
        // Used to alternate between white and black squares
        var toggle:Bool = false
        for row in 0...numRows-1 {
            for col in 0...numCols-1 {
                // Letter for this column
                //let colChar = Array(alphas)[col]
                // Determine the color of square
                let color = toggle ? SKColor.white : SKColor.black
                let square = SKSpriteNode(color: color, size: squareSize)
                square.position = CGPoint(x: CGFloat(col) * squareSize.width,
                                          y: CGFloat(row) * squareSize.height)
                // Set sprite's name (e.g., a8, c5, d1)
                //square.name = "\(colChar)\(8-row)"
                self.addChild(square)
                toggle = !toggle
            }
            toggle = !toggle
        }
    }

}
