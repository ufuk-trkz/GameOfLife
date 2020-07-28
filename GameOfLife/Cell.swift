//
//  Cell.swift
//  GameOfLife
//
//  Created by Ufuk Türközü on 27.07.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import Foundation
import SpriteKit

enum State {
    case alive
    case dead
}

class Cell {
    var state: State? {
        didSet {
            if state == State.alive {
                color = SKColor.black
            } else if state == State.dead {
                color = SKColor.white
            }
        }
    }
    var color: SKColor?
    
}
