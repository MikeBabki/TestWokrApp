//
//  BeerCatalogViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 08.06.2023.
//

import UIKit

class BeerCatalogViewController: UIViewController {

    // MARK: - Private properties
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var beerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 300
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.identifier)
        return tableView
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupText()
    }
}

extension BeerCatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as? BeerTableViewCell else {
            fatalError("TableView could not deque CustomCell in ViewController")
        }
        if indexPath.row % 2 == 0
        {
            cell.beerNameLabel.text = "sdfghjkjhg"
            cell.beerDescriptionlabel.text = "dfghjkjhgfdfghj"
        }
        else
        {
            cell.beerNameLabel.text = "sdfghjkjhgsdfghjkjhgsdfghjkjhgsdfghjkjhgsdfghjkjhgsdfghjkjhgsdfghjkjhgsdfghjkjhgsdfghjkjhgsdfgdfghgfghjhgfdfghjhgfdfghjhgfdfghhjkjhg"
            cell.beerDescriptionlabel.text = "dfghjkjhgfdfghjdfghjkjhgfdfghjdfghjkjhgfdfghjdfghjkjhgfdfghjdfghjkjhgfdfghjdfghjkjhgfdfghjdfghjkjhgfdfghj"
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension BeerCatalogViewController {
    
    func setupText() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.backgroundColor = .clear
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: UIBarButtonItem.Style.done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        // MARK: - Constraint (tableView)
        view.addSubview(beerTableView)
        
        NSLayoutConstraint.activate([
            
            beerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            beerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            beerTableView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0),
            beerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
        ])
    }
}
