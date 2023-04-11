//
//  WelcomeViewController.swift
//  Lesson 2.4
//
//  Created by Иван on 12.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainViewController" {
            if segue.destination is MainViewController {
                
            }
        }
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        
    }
}
