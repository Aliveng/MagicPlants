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
    
    lazy var cellCardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.numberOfLines = 0
        view.textAlignment = .left
   //     view.font = view.font.withSize(15)
        return view
    }()
    
    lazy var priseLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    lazy var sizeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cellCardView)
        cellCardView.addSubview(imageView)
        cellCardView.addSubview(sizeLabel)
        cellCardView.addSubview(nameLabel)
        cellCardView.addSubview(priseLabel)
        
        cellCardView.snp.makeConstraints({ item in
            item.left.equalToSuperview()
            item.right.equalToSuperview()
            item.height.equalTo(261)
            item.width.equalTo(216)
            item.bottom.equalToSuperview()
        })
        
        imageView.snp.makeConstraints({ item in
            item.height.equalTo(271)
            item.width.equalTo(200)
            item.centerX.equalToSuperview()
            item.bottom.equalToSuperview().offset(-59.57)
        })
        
        nameLabel.snp.makeConstraints({ item in
            item.left.equalToSuperview().offset(16)
            item.bottom.equalTo(priseLabel.snp.top).offset(-10)
        })
        
        priseLabel.snp.makeConstraints({ item in
            item.bottom.equalToSuperview().offset(-20)
            item.right.equalToSuperview().offset(-70)
        })
        
        

        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
