//
//  itemCell.swift
//  BabyPink
//
//  Created by Татьяна Севостьянова on 28/10/2019.
//  Copyright © 2019 Татьяна Севостьянова. All rights reserved.
//

import UIKit
import SnapKit


class ItemCell: UICollectionViewCell {
    
    var colorCustom: UIColor = .white {
        didSet {
            nameLabel.textColor = colorCustom
            priseLabel.textColor = colorCustom
            sizeLabel.textColor = colorCustom
        }
    }
    
    lazy var cellCardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var shadowCellCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = CGSize(width: 2, height: 8)
        return view
    }()
    
    lazy var bagButton: UIButton = {
        let view = UIButton()
        view.isEnabled = true
        view.setImage(.bagButton, for: .normal)
        view.addTarget(self,
                       action: #selector(didTapBagButton),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = colorCustom
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    lazy var priseLabel: UILabel = {
        let view = UILabel()
        view.textColor = colorCustom
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    lazy var sizeLabel: UILabel = {
        let view = UILabel()
        view.textColor = colorCustom
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = .boldSystemFont(ofSize: 12)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(shadowCellCardView)
        addSubview(cellCardView)
        cellCardView.addSubview(imageView)
        cellCardView.addSubview(sizeLabel)
        cellCardView.addSubview(nameLabel)
        cellCardView.addSubview(priseLabel)
        cellCardView.addSubview(bagButton)
        
        cellCardView.snp.makeConstraints({ item in
            item.left.equalToSuperview()
            item.right.equalToSuperview()
            item.height.equalTo(261)
            item.width.equalTo(216)
            item.bottom.equalToSuperview()
        })
        
        shadowCellCardView.snp.makeConstraints({ item in
            item.left.equalToSuperview()
            item.right.equalToSuperview()
            item.height.equalTo(200)
            item.width.equalTo(50)
            item.bottom.equalToSuperview().offset(-25)
        })
        
        sizeLabel.snp.makeConstraints({ item in
            item.left.equalToSuperview().offset(12)
            item.top.equalToSuperview().offset(85)
        })
        
        imageView.snp.makeConstraints({ item in
            item.height.equalTo(271)
            item.width.equalTo(200)
            item.centerX.equalToSuperview()
            item.bottom.equalToSuperview().offset(-59.57)
        })
        
        nameLabel.snp.makeConstraints({ item in
            item.left.equalToSuperview().offset(20)
            item.right.equalToSuperview()
            item.bottom.equalTo(priseLabel.snp.top)
        })
        
        priseLabel.snp.makeConstraints({ item in
            item.left.equalToSuperview().offset(20.93)
            item.bottom.equalToSuperview().offset(-18)
        })
        
        bagButton.snp.makeConstraints({ item in
            item.height.equalTo(50)
            item.width.equalTo(50)
            item.right.equalToSuperview().offset(-18)
            item.bottom.equalToSuperview().offset(-19)
        })

    }
    
    @objc
    private func didTapBagButton() {
        print("\(nameLabel.text) добавлен в карзину")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
