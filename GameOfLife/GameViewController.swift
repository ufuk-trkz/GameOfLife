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
    @IBOutlet weak var gridView: GridView!
    @IBOutlet weak var preset1Button: UIButton!
    @IBOutlet weak var preset2Button: UIButton!
    @IBOutlet weak var preset3Button: UIButton!
    @IBOutlet weak var preset4Button: UIButton!
    @IBOutlet weak var oneStepButton: UIButton!
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        gridView.matrix = gridView.newMatrix()
        gridView.nextMatrix = gridView.newMatrix()

        // Configure the view
        gridView.isMultipleTouchEnabled = false
        gridView.updateGrid()
    }
    @IBAction func oneStep(_ sender: Any) {
        gridView.computeNext(label: genarationLabel)
    }
    @IBAction func play(_ sender: Any) {
        gridView.configureTimer(label: genarationLabel)
    }
    @IBAction func stop(_ sender: Any) {
        gridView.configureTimer(label: genarationLabel)
        gridView.resetGrid()
        genarationLabel.text = "Generation: #"
    }
    
    @IBAction func preset1(_ sender: Any) {
        gridView.preset1()
    }
    @IBAction func preset2(_ sender: Any) {
        gridView.preset2()
    }
    @IBAction func preset3(_ sender: Any) {
        gridView.preset3()
    }
    @IBAction func preset4(_ sender: Any) {
        gridView.preset4()
    }
    
    @IBAction func random(_ sender: Any) {
        gridView.randomSet()
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
