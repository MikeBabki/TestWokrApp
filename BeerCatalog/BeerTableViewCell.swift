//
//  BeerTableViewCell.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 08.06.2023.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    static let identifier = "BeerTableViewCell"
    
    private lazy var beerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "xmzXJZxhzxzKxildqjldjdljsdklakldaskldjsalkjdkalsdklsajdlkjdlkasjdlkasjdlkasjdklasjldsajkdajkldkljasdjkasdassnaSAmshkajhskjahskajhskajhsjkahskjahskjahskajsahkjshkjSHKJAshkjashkjashkjshkjsdzXJZxhzxzKxildqjldjdljsdklakldaskldjsalkjdkalsdklsajdlkjdlkasjdlkasjdlkasjdklasjldsajkdajkldkljasdjkasdassnaSAmshkajhskjahskajhskajhsjkahskjahskjahskajsahkjshkjSHKJAshkjashkjashkjshkjsdzXJZxhzxzKxildqjldjdljsdklakldaskldjsalkjdkalsdklsajdlkjdlkasjdlkasjdlkasjdklasjldsajkdajkldkljasdjkasdassnaSAmshkajhskjahskajhskajhsjkahskjahskjahskajsahkjshkjSHKJAshkjashkjashkjshkjsd"
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var beerDescriptionlabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.text = "sdnjasndkjasdjkasdklsajdklasjdklasjdklasjdklsadklasdjlkasdkjadjladjkladjklajskdakjld"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favouriteIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupUI() {
        self.contentView.addSubview(beerImage)
        self.contentView.addSubview(beerNameLabel)
        self.contentView.addSubview(beerDescriptionlabel)
        
        self.contentView.addSubview(favouriteIcon)
        
        NSLayoutConstraint.activate([
        
            beerImage.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            
            beerImage.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            beerImage.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor ),
        
            beerNameLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 16),
            beerNameLabel.trailingAnchor.constraint(equalTo: favouriteIcon.leadingAnchor, constant: -8),
            beerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            beerNameLabel.bottomAnchor.constraint(equalTo: beerDescriptionlabel.topAnchor, constant: 16),
            
            
            beerDescriptionlabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 16),
            beerDescriptionlabel.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: 8),
            beerDescriptionlabel.trailingAnchor.constraint(equalTo: favouriteIcon.leadingAnchor, constant: -8),
            beerDescriptionlabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            
            beerImage.heightAnchor.constraint(lessThanOrEqualToConstant: 90),
            beerImage.widthAnchor.constraint(equalToConstant: 90),
            
            favouriteIcon.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            favouriteIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
            
        ])
    }
    
}
