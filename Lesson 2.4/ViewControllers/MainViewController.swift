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
    
    @IBOutlet private weak var redTextField: UITextField!
    @IBOutlet private weak var greenTextField: UITextField!
    @IBOutlet private weak var blueTextField: UITextField!
    
    // MARK: - Private constants
    private let toolbar = UIToolbar()
    
    // MARK: - Public variables
    weak var delegate: MainViewControllerDelegate?
    var redValue: Float?
    var greenValue: Float?
    var blueValue: Float?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        updateBackgroundView()
        updateLabelText()
        updateSliderValue()
        updateTextFields()
        setUpToolBar()
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
        updateTextFields()
        delegate?.didUpdateBackgroundColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value))
        redValue = redSlider.value
        greenValue = greenSlider.value
        blueValue = blueSlider.value
    }
}

// MARK: - MainViewController
extension MainViewController: UITextFieldDelegate {
    
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
    
    private func updateTextFields() {
        redTextField.text = String(format: "%.2f", redValue!)
        greenTextField.text = String(format: "%.2f", greenValue!)
        blueTextField.text = String(format: "%.2f", blueValue!)
    }
    
    private func setUpToolBar() {
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexSpace, doneButton]
        redTextField.inputAccessoryView = toolbar
        greenTextField.inputAccessoryView = toolbar
        blueTextField.inputAccessoryView = toolbar
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let number = Float(text) else { return }
        switch textField {
        case redTextField:
            redNumberLabel.text = String(format: "%.2f", number)
            redValue = number
        case greenTextField:
            greenNumberLabel.text = String(format: "%.2f", number)
            greenValue = number
        case blueTextField:
            blueNumberLabel.text = String(format: "%.2f", number)
            blueValue = number
        default:
            break
        }
        updateBackgroundView()
        updateSliderValue()
    }
    
    @objc func doneButtonPressed() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - MainViewControllerDelegate
protocol MainViewControllerDelegate: AnyObject {
    func didUpdateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}


