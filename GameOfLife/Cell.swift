//
//  Cell.swift
//  GameOfLife
//
//  Created by Ufuk Türközü on 27.07.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import Foundation
import SpriteKit

class Cell: UIView {
    
    var dead: Bool = true
    
    init(frame: CGRect, dead: Bool = true) {
        super.init(frame: frame)
        self.dead = dead
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func die() {
        dead = true
        backgroundColor = .white
    }
    
    func comeAlive() {
        dead = false
        backgroundColor = .black
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dead {
            comeAlive()
        } else {
            die()
        }
    }
}
