//
//  MaltDescriptionView.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 21.06.2023.
//

import UIKit
import TinyConstraints

class MaltDescriptionView: UIView {
    
    var model: Malt?

    private lazy var contentView: UIView = {
        let view = UIView()
       
        return view
    }()
    
    private lazy var ingridientName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var ingridientVolume: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        
        return label
    }()
    private lazy var ingridientUnit: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .light)
        
        return label
    }()

    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupUI()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withModel model: Malt?) {
        self.model = model
        print(model)
        
        if let maltNames = model?.name {
            ingridientName.text = maltNames
        }
        print(ingridientName.text)
        

        if let maltVolumes = model?.amount?.value {
            ingridientVolume.text = "\(maltVolumes)"
        }
        print(ingridientVolume.text)
        
        if let maltUnit = model?.amount?.unit {
            ingridientUnit.text = "\(maltUnit)"
        }
    }

    
}

//func configure(withModel model: Ingredients?) {
//
//    self.model = model
//
//
//    if let maltNames = model?.malt?.compactMap({ $0.name }) {
//        ingridientName.text = maltNames.joined(separator: ", ")
//    }
//    print(ingridientName.text)
//
//
//    if let maltVolumes = model?.malt?.flatMap({ $0.amount?.value }) {
//        let volumeString = maltVolumes.reduce("", { $0 + "\($1) " })
//        ingridientVolume.text = volumeString
//    }
//}
//
//}
//        if let maltVolumes = model?.malt?.compactMap({ $0.amount?.value }) {
//            ingridientVolume.text = "\(maltVolumes)"
//        }
//        
//        if let maltNames = model?.malt?.compactMap({ $0.name }) {
//            ingridientName.text = "\(maltNames)"
//        }

       


//        model.map({ item in
////            ingridientName.text = item.malt?[0].name
//            ingridientName.text = "\(item.malt?.map({$0.name}))"
//
////            ingridientVolume.text = ("\(item.malt?[0].amount?.value)")
//            ingridientVolume.text = ("\(item.malt?.map({$0.amount?.value}))")
//
//        })
        
//      json.arrayValue.map { item in
        
//        let malto = item["ingredients"]["malt"].arrayValue.map({ malt in
//            let amount = Amount(value: malt["amount"]["value"].floatValue, unit: malt["amount"]["unit"].stringValue)
//          return Malt(name: malt["name"].stringValue, amount: amount)
//
//         })
  

extension MaltDescriptionView {
    func setupUI() {
        
        addSubview(contentView)
        contentView.addSubview(ingridientName)
        contentView.addSubview(ingridientVolume)
        contentView.addSubview(ingridientUnit)
        
        contentView.edgesToSuperview()
        contentView.centerXAnchor
        contentView.width(contentView.frame.width)
//        contentView.centerXToSuperview()
//        contentView.height(50)
        
        ingridientName.leading(to: contentView, offset: 32)
//        ingridientName.trailingToLeading(of: ingridientVolume, offset: -10)
        ingridientName.centerYAnchor

//        ingridientVolume.trailing(to: ingridientUnit, offset: -32)
        ingridientVolume.trailingToLeading(of: ingridientUnit, offset: -16)
        ingridientVolume.centerYAnchor
        
        ingridientUnit.trailing(to: contentView, offset: -32)
        ingridientUnit.leadingToTrailing(of: ingridientVolume, offset: 10)
        ingridientUnit.centerYAnchor
    }
}

