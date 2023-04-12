//
//  WelcomeViewController.swift
//  Lesson 2.4
//
//  Created by Иван on 12.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainViewController" {
            if let destinationVC = segue.destination as? MainViewController {
                destinationVC.delegate = self
            }
        }
    }
    
    // MARK: - Private @IBAction
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? MainViewController {
            didUpdateBackgroundColor(red: CGFloat(sourceVC.redValue),
                                     green: CGFloat(sourceVC.greenValue),
                                     blue: CGFloat(sourceVC.blueValue))
        }
    }
}

// MARK: - WelcomeViewController
extension WelcomeViewController: MainViewControllerDelegate {
    func didUpdateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
