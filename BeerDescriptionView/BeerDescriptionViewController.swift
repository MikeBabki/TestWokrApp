//
//  BeerDescriptionViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 14.06.2023.
//

import UIKit
import TinyConstraints

class BeerDescriptionViewController: UIViewController {
    
    private lazy var beerImageMain: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
                image.image = UIImage(systemName: "wineglass.fill")
//        image.image = UIImage(named: "mainImage")
        return image
        
    }()
    private lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Beer name"
        return label
        
    }()
    private lazy var beerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Beer description"
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        view.backgroundColor = .white
    }
    @objc func tapHandler(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("state ended")
        }
    }
}
    

extension BeerDescriptionViewController {
    func setupUI() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))

        self.beerImageMain.addGestureRecognizer(tapGestureRecognizer)
        self.beerImageMain.isUserInteractionEnabled = true
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
        
        // MARK: - Constraint (tableView)
        
        view.addSubview(beerImageMain)
        view.addSubview(beerNameLabel)
        view.addSubview(beerDescriptionLabel)
        
        beerImageMain.top(to: view.layoutMarginsGuide, offset: 16)
        beerImageMain.height(220)
        beerImageMain.centerX(to: view)
        
        beerNameLabel.topToBottom(of: beerImageMain, offset: 16)
        beerNameLabel.centerXToSuperview()
        
        beerDescriptionLabel.top(to: beerNameLabel, offset: 32)
        beerDescriptionLabel.centerXToSuperview()
    }
}
