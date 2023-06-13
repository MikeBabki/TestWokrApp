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
        view.backgroundColor = .red

    }
}
