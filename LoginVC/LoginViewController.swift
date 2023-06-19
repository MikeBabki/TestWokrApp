//
//  LoginViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 05.06.2023.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var visualBlur: UIVisualEffectView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    private var networkInstanse = NetworkManager()
    
    // MARK: - LifeCycle - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupText()
        setupUI()
    }
    
    // MARK: - Action
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let mbProgHud = MBProgressHUD.showAdded(to: self.view, animated: true)
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        networkInstanse.loginApiCall(email: login, password: password) { (searchResponse) in
            DispatchQueue.main.async {
                switch searchResponse {

                case.success(let data):

                    mbProgHud.hide(animated: true)
                    let beerCatalogVC = BeerCatalogViewController()
                    guard let navigationController = self.navigationController
                    else { return }

                    var navigationArray = navigationController.viewControllers
                    let temp = navigationArray.last
                    navigationArray.removeAll()
                    navigationArray.append(beerCatalogVC)
                    navigationController.setViewControllers(navigationArray, animated: true)

                case.failure(let error):
                    mbProgHud.hide(animated: true)
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true)

                }
            }
        }
    }
}

// MARK: - Extentions (setupText, setupUI)

extension LoginViewController {
    func setupText() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "BeerLoga"
    }
}

extension LoginViewController {
    func setupUI() {
        passwordTextField.isSecureTextEntry = true
    }
}
