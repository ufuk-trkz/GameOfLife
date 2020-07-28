//
//  Array2D.swift
//  GameOfLife
//
//  Created by Ufuk Türközü on 27.07.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import Foundation

struct Array2D<T> {
    let columns: Int
    let rows: Int
    private var array: [T?]
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows*columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row * columns + column]
        }
        set {
            array[row * columns + column] = newValue
        }
    }
}
