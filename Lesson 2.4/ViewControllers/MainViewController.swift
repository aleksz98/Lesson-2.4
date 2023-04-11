//
//  ViewController.swift
//  Lesson 2.4
//
//  Created by Иван on 26.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var backgroundColorView: UIView!
    
    @IBOutlet private weak var redNumberLabel: UILabel!
    @IBOutlet private weak var greenNumberLabel: UILabel!
    @IBOutlet private weak var blueNumberLabel: UILabel!
    
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private @IBAction
    @IBAction private func sliderValueChanged(_ sender: UIButton) {
        updateUI()
        updateInfo()
    }
}

// MARK: - MainViewController
extension MainViewController {
    
    private func updateInfo() {
        let values = [redSlider.value, greenSlider.value, blueSlider.value]
        let labels = [redNumberLabel, greenNumberLabel, blueNumberLabel]
        
        for (index, label) in labels.enumerated() {
            label?.text = String(format: "%.2f", values[index])
        }
    }
    
    private func updateUI() {
        backgroundColorView.layer.cornerRadius = 10
        backgroundColorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
}
