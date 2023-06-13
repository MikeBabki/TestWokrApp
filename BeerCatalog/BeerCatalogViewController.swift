//
//  BeerCatalogViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 08.06.2023.
//

import UIKit
import MBProgressHUD
import TinyConstraints


class BeerCatalogViewController: UIViewController {

    // MARK: - Private properties
    
    private var beerModel = [BeerModel]()
    var pageNumber = 1
    
    private var networkManagerInstance = NetworkManager()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        return view
        
    }()
    
    private lazy var beerTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.identifier)
        return tableView
        
    }()
    private lazy var loadErrorView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        return view
        
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private lazy var errorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Error load description"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .light)

        return label
    }()
    
    private lazy var retryConnectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Retry", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(retryConnection), for: .touchUpInside)
//        textField.addTarget(self, action: #selector(firstPasswordTextField), for: .editingChanged)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadBeer()
        setupText()
    }
    
    @objc func loadBeer() {
//        MBProgressHUD.showAdded(to: self.view, animated: true)
        networkManagerInstance.getResult(page: self.pageNumber) { (searchResponse) in
            switch searchResponse {
            case.success(let data):
                DispatchQueue.main.async {
                    data?.forEach {
                        self.beerModel.append($0)
                    }
                    self.beerTableView.reloadData()
                }
            case .failure(let error):
//                MBProgressHUD.hide(for: self.view, animated: true)
                self.loadErrorView.isHidden = false
                self.errorDescriptionLabel.text = error.localizedDescription
                
            }
        }
    }
    
    @objc func myAccount() {
            let vc = ProfileViewController()
            present(vc, animated: true)
        }
    @objc func retryConnection(sender : UIButton) {
        loadBeer()
    }
}

extension BeerCatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beerModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as? BeerTableViewCell else {
            fatalError("TableView could not deque CustomCell in ViewController")
        }
        let model = beerModel[indexPath.row]
        cell.configure(withModel: model)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension BeerCatalogViewController {
    
    func setupText() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.backgroundColor = .clear
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: UIBarButtonItem.Style.done, target: self, action: #selector(myAccount))
        self.navigationItem.rightBarButtonItem = rightButton
     

        // MARK: - Constraint (tableView)
        
        view.addSubview(beerTableView)
        
        view.addSubview(loadErrorView)
        loadErrorView.addSubview(errorLabel)
        loadErrorView.addSubview(errorDescriptionLabel)
        loadErrorView.addSubview(retryConnectionButton)
        
        beerTableView.edgesToSuperview()
        
        //Error View
        
        loadErrorView.left(to: view, offset: 64)
        loadErrorView.right(to: view, offset: -64)
        loadErrorView.centerY(to: view)
        
        errorLabel.top(to: loadErrorView, offset: 16)
        errorLabel.centerX(to: loadErrorView)
        
        errorDescriptionLabel.top(to: errorLabel, offset: 32)
        errorDescriptionLabel.leading(to: loadErrorView, offset: 16)
        errorDescriptionLabel.trailing(to: loadErrorView, offset: -16)
        errorDescriptionLabel.centerX(to: loadErrorView)
        
        retryConnectionButton.topToBottom(of: errorDescriptionLabel, offset: 16)
        retryConnectionButton.bottom(to: loadErrorView, offset: -16)
        retryConnectionButton.centerX(to: loadErrorView)
        retryConnectionButton.width(70)
        
    }
}
