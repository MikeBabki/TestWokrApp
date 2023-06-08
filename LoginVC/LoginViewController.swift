//
//  LoginViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 05.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var visualBlur: UIVisualEffectView!
    @IBOutlet weak var loginView: UIView!
    
    // MARK: - LifeCycle - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupText()
    }
}

extension LoginViewController {
    func setupText() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "BeerLoga"
    }
}
