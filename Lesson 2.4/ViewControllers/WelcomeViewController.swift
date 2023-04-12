//
//  WelcomeViewController.swift
//  Lesson 2.4
//
//  Created by Иван on 12.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Public variables
    var redValue: Float?
    var greenValue: Float?
    var blueValue: Float?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainViewController" {
            if let destinationVC = segue.destination as? MainViewController {
                destinationVC.redValue = redValue ?? 1
                destinationVC.greenValue = greenValue ?? 1
                destinationVC.blueValue = blueValue ?? 1
                destinationVC.delegate = self
            }
        }
    }
    
    // MARK: - Private @IBAction
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? MainViewController {
            didUpdateBackgroundColor(red: CGFloat(sourceVC.redValue ?? 1),
                                     green: CGFloat(sourceVC.greenValue ?? 1),
                                     blue: CGFloat(sourceVC.blueValue ?? 1))
        }
    }
}

// MARK: - WelcomeViewController
extension WelcomeViewController: MainViewControllerDelegate {
    func didUpdateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
