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
        // Do any additional setup after loading the view.
        updateSliders()
    }
}

extension MainViewController {
    
    // MARK: - Private functions
    @objc private func sliderValueChanged() {
        updateColor()
        updateSliderValueLabels()
    }
    
    private func updateSliders() {
        redSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        updateColor()
    }
    
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        backgroundColorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func updateSliderValueLabels() {
        let redValue = String(format: "%.2f", redSlider.value)
        let greenValue = String(format: "%.2f", greenSlider.value)
        let blueValue = String(format: "%.2f", blueSlider.value)
        redNumberLabel.text = redValue
        greenNumberLabel.text = greenValue
        blueNumberLabel.text = blueValue
    }
}
