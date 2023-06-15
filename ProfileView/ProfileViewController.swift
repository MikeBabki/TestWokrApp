//
//  ProfileViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 13.06.2023.
//

import UIKit
import TinyConstraints

class ProfileViewController: UIViewController {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        return view
        
    }()
    
    private lazy var profileView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
     func someHandler(alert: UIAlertAction!) {
         
         KeychainManager.deleteToken(service: "restapi.adequateshop.com")
    }
    @objc func myAccount() {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: someHandler))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension ProfileViewController {
    func setupUI() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.square"), style: UIBarButtonItem.Style.done, target: self, action: #selector(myAccount))
        self.navigationItem.rightBarButtonItem = rightButton
    }
}
