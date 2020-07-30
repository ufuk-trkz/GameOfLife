//
//  GameScene.swift
//  GameOfLife
//
//  Created by Ufuk Türközü on 27.07.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    var matrix = [[Cell]]()
    var nextMatrix = [[Cell]]()
    
    private func newMatrix(col: Int, row: Int) -> [[Cell]]{
        let squareSize = CGSize(width: Int(self.bounds.width)/row, height: Int(self.bounds.height))
        var matrix = [[Cell]]()
        var column = [Cell]()
        for x in 0...col-1 {
            for y in 0...row-1 {
                let cell = Cell(frame: CGRect(x: CGFloat(col) * squareSize.width,
                                              y: CGFloat(row) * squareSize.height,
                                              width: CGFloat(self.bounds.width) / CGFloat(col),
                                              height: CGFloat(self.bounds.height) / CGFloat(row)))
                self.addSubview(cell)
                column.append(cell)
            }
            matrix.append(column)
            column.removeAll()
        }
        return matrix
    }
    
//    func drawBoard(with matrix: [[Cell]], arr: [Cell]) {
//        // Board parameters
//        let numRows = matrix.count
//        let numCols = arr.count
//        let squareSize = CGSize(width: Int(size.width)/numRows, height: Int(size.height))
//        // Column characters
//        // Used to alternate between white and black squares
//        var dead: Bool = false
//        
//        for row in matrix {
//            for col in arr {
//                // Letter for this column
//                //let colChar = Array(alphas)[col]
//                // Determine the color of square
//                let color = col.dead ? SKColor.white : SKColor.black
//                let square = SKSpriteNode(color: color, size: squareSize)
//                square.position = CGPoint(x: CGFloat(col) * squareSize.width,
//                                          y: CGFloat(row) * squareSize.height)
//                // Set sprite's name (e.g., a8, c5, d1)
//                //square.name = "\(colChar)\(8-row)"
//                self.addChild(square)
//                dead = !dead
//            }
//            dead = !dead
//        }
//    }

}
