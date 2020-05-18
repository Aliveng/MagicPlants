//
//  NavigationView.swift
//  iDatchik_Profile
//
//  Created by Татьяна Севостьянова on 17.03.2020.
//  Copyright © 2020 Татьяна Севостьянова. All rights reserved.
//

import UIKit
import  SnapKit

class NavigationView: UIView {
    
    let navigationController: UINavigationController
    
    lazy var profileButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setImage(.profile, for: .normal)
        view.addTarget(self,
                       action: #selector(didTapProfile),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var mainButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setImage(.main, for: .normal)
        view.addTarget(self,
                       action: #selector(didTapMain),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var basketButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setImage(.basket, for: .normal)
        view.addTarget(self,
                       action: #selector(didTapBasket),
                       for: .touchUpInside)
        return view
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init(frame: .zero)
        
        addSubview(profileButton)
        addSubview(mainButton)
        addSubview(basketButton)
        backgroundColor = .white
        
        profileButton.snp.makeConstraints({ item in
            item.height.equalTo(18)
            item.width.equalTo(15.5)
            item.centerY.equalTo(mainButton.snp.centerY)
            item.right.equalTo(mainButton.snp.left).offset(-65.5)
            item.top.equalToSuperview().offset(3)
        })
        
        mainButton.snp.makeConstraints({
            $0.height.equalTo(18)
            $0.width.equalTo(18)
            $0.center.equalToSuperview()
            $0.top.equalToSuperview().offset(3)
        })
        
        basketButton.snp.makeConstraints({ item in
            item.height.equalTo(20.86)
            item.width.equalTo(21)
            item.centerY.equalTo(mainButton.snp.centerY)
            item.left.equalTo(mainButton.snp.right).offset(65.5)
            item.top.equalToSuperview().offset(3)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTapBasket() {
        //    navigationController.pushViewController(MoreViewController(), animated: true)
        print("Переход в карзину")
    }
    
    @objc
    private func didTapMain() {
        print("Переход на главный экран или к каталогу")
    }
    
    @objc
    private func didTapProfile() {
        print("Переход в профиль")
    }
}
