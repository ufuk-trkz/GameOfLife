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
    
    var generation: Int = 0
    var timer = Timer()
    
    var col = 25
    var row = 25
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.matrix = newMatrix()
//        self.nextMatrix = newMatrix()
//    }
//
//    required init?(coder: NSCoder) {
//        //super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func newMatrix() -> [[Cell]]{
        let squareSize = CGSize(width: Int(self.bounds.width)/col, height: Int(self.bounds.height)/row)
        var column = [Cell]()
        var matrix = [[Cell]]()
        for x in 0...col-1 {
            for y in 0...row-1 {
                let cell = Cell(frame: CGRect(x: CGFloat(x) * squareSize.width,
                                              y: CGFloat(y) * squareSize.height,
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
    
    func updateGrid() {
        for x in 0...col-1 {
            for y in 0...row-1 {
                if nextMatrix[x][y].dead {
                    matrix[x][y].die()
                } else {
                    matrix[x][y].comeAlive()
                    print(x, y, self.matrix[x][y].dead)
                }
            }
        }
    }
    
    func configureTimer(label: UILabel) {
        if timer.isValid {
            timer.invalidate()
            self.isUserInteractionEnabled = true
        } else {
            self.isUserInteractionEnabled = false
            timer.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true, block: { (timer) in
                self.computeNext(label: label)
            })
        }
    }
    
    func countNeighbors(x: Int, y: Int) -> Int{
        var count = 0
        let rows = 25
        
        for i in x-1...x+1 {
            for j in y-1...y+1 {
                if (i == x && j == y) || (i >= rows) || (j >= rows) || ( i < 0 ) || (j < 0) {
                    continue
                }
                if matrix[i][j].dead == false { count += 1}
            }
        }
        return count
    }
    
    func computeNext(label: UILabel){
        generation += 1
        label.text = "Generation: \(generation)"
    
        for x in 0...24 {
            for y in 0...24 {
                let state = matrix[x][y].dead
                let neighbors = countNeighbors(x: x, y: y)
                if state == false {
                    if neighbors == 2 || neighbors == 3 {
                        nextMatrix[x][y].comeAlive()
                    } else {
                        nextMatrix[x][y].die()
                    }
                } else {
                    if neighbors == 3 {
                        nextMatrix[x][y].comeAlive()
                    }
                }
            }
        }
        updateGrid()
    }
    
    func resetGrid() {
        generation = 0
        for x in 0...nextMatrix.count-1 {
            for y in 0...nextMatrix.count-1 {
                nextMatrix[x][y].die()
            }
        }
    }
    
    func preset1() {
        resetGrid()
        // Block
        let x = col/2
        let y = row/2
        
        nextMatrix[x][y].comeAlive()
        nextMatrix[x+1][y].comeAlive()
        nextMatrix[x][y-1].comeAlive()
        nextMatrix[x+1][y-1].comeAlive()
        
        updateGrid()
    }
    
    func preset2() {
        resetGrid()
        // Behive
        let x = col/2
        let y = row/2
        
        nextMatrix[x][y].comeAlive()
        nextMatrix[x+1][y].comeAlive()
        nextMatrix[x-1][y-1].comeAlive()
        nextMatrix[x+2][y-1].comeAlive()
        nextMatrix[x][y-2].comeAlive()
        nextMatrix[x+1][y-2].comeAlive()
        
        updateGrid()
    }
    
    func preset3() {
        resetGrid()
        // Loaf
        let x = col/2
        let y = row/2
        
        nextMatrix[x][y].comeAlive()
        nextMatrix[x+2][y].comeAlive()
        nextMatrix[x-1][y-1].comeAlive()
        nextMatrix[x+2][y-1].comeAlive()
        nextMatrix[x][y-2].comeAlive()
        nextMatrix[x+1][y-2].comeAlive()
        nextMatrix[x+1][y+1].comeAlive()
        
        updateGrid()
    }
    
    func preset4() {
        resetGrid()
        // Tub
        let x = col/2
        let y = row/2
        
        nextMatrix[x-1][y].comeAlive()
        nextMatrix[x][y-1].comeAlive()
        nextMatrix[x][y+1].comeAlive()
        nextMatrix[x+1][y].comeAlive()
        
        updateGrid()
    }
    
    func randomSet() {
        for x in nextMatrix {
            for _ in Range(0...24) {
                x.randomElement()?.comeAlive()
                
            }
        }
        updateGrid()
    }
    
}
