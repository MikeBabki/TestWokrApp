//
//  ViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 04.06.2023.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var asGuestButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
    }
}

    // MARK: - Extention fot styling

extension ViewController {
    func setupUI() {

        buttonsView.layer.masksToBounds = true
        buttonsView.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        buttonsView.layer.shadowRadius = 5
        buttonsView.layer.shadowOpacity = 0.3
        buttonsView.layer.cornerRadius = 16
    }
}
