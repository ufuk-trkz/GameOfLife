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
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var decSpeedButton: UIButton!
    @IBOutlet weak var incSpeedButton: UIButton!
    
    @IBOutlet weak var randomButton: UIButton!
    
    // MARK: - Properties
    var speed: Double = 1
    var isRunning: Bool = false {
        didSet {
            if isRunning {
                preset1Button.isEnabled = false
                preset2Button.isEnabled = false
                preset3Button.isEnabled = false
                preset4Button.isEnabled = false
                randomButton.isEnabled = false
                decSpeedButton.isEnabled = false
                incSpeedButton.isEnabled = false
            } else {
                preset1Button.isEnabled = true
                preset2Button.isEnabled = true
                preset3Button.isEnabled = true
                preset4Button.isEnabled = true
                randomButton.isEnabled = true
                decSpeedButton.isEnabled = true
                incSpeedButton.isEnabled = true
            }
        }
    }

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
        isRunning.toggle()
        gridView.configureTimer(label: genarationLabel, speed: speed)
    }
    @IBAction func stop(_ sender: Any) {
        if isRunning {
            gridView.configureTimer(label: genarationLabel, speed: speed)
        }
        gridView.resetGrid()
        genarationLabel.text = "Generation: #"
        isRunning.toggle()
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
    
    @IBAction func increaseSpeed(_ sender: Any) {
        speed += 0.1
        speedLabel.text = String(format: "%.1f", speed) + "s"
    }
    @IBAction func decreaseSpeed(_ sender: Any) {
        if speed != 0.1 {
            speed -= 0.1
            speedLabel.text = String(format: "%.1f", speed) + "s"
        }
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
