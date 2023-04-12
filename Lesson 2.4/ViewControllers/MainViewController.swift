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
    
    // MARK: - Public variables
    weak var delegate: MainViewControllerDelegate?
    var redValue: Float?
    var greenValue: Float?
    var blueValue: Float?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackgroundView()
        updateLabelText()
        updateSliderValue()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToWelcomeViewController" {
            if let destinationVC = segue.destination as? WelcomeViewController {
                destinationVC.redValue = redSlider.value
                destinationVC.greenValue = greenSlider.value
                destinationVC.blueValue = blueSlider.value
            }
        }
    }
    
    // MARK: - Private @IBAction
    @IBAction private func sliderValueChanged(_ sender: UIButton) {
        updateBackgroundView()
        updateSliders()
        delegate?.didUpdateBackgroundColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value))
        redValue = redSlider.value
        greenValue = greenSlider.value
        blueValue = blueSlider.value
    }
}

// MARK: - MainViewController
extension MainViewController {
    
    private func updateSliders() {
        for (index, label) in [(redNumberLabel, redSlider.value), (greenNumberLabel, greenSlider.value), (blueNumberLabel, blueSlider.value)] {
            index?.text = String(format: "%.2f", label)
        }
    }
    
    private func updateBackgroundView() {
        backgroundColorView.layer.cornerRadius = 10
        backgroundColorView.backgroundColor = UIColor(red: CGFloat(redValue ?? 1),
                                                      green: CGFloat(greenValue ?? 1),
                                                      blue: CGFloat(blueValue ?? 1),
                                                      alpha: 1)
    }

    private func updateLabelText() {
        for (label, value) in [(redNumberLabel, redValue), (greenNumberLabel, greenValue), (blueNumberLabel, blueValue)] {
                  label?.text = String(format: "%.2f", value ?? 1)
        }
    }
    
    private func updateSliderValue() {
        redSlider.value = redValue!
        greenSlider.value = greenValue!
        blueSlider.value = blueValue!
    }

}

// MARK: - MainViewControllerDelegate
protocol MainViewControllerDelegate: AnyObject {
    func didUpdateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}
