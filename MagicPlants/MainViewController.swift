//
//  ViewController.swift
//  MagicPlants
//
//  Created by Татьяна Севостьянова on 18.05.2020.
//  Copyright © 2020 Татьяна Севостьянова. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var bottomPanelView: NavigationView = {
        let view = NavigationView(navigationController: self.navigationController!)
       // view.layer.borderColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
     //   view.layer.borderWidth = 1
        return view
    }()

    override func loadView() {
        super.loadView()

        view.addSubview(bottomPanelView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.barStyle = .black
        let menuButton = UIBarButtonItem(image: .menu, style: .plain, target: self,
                                              action: #selector(didTapMenu) )
        menuButton.tintColor = .black
        navigationItem.leftBarButtonItem = menuButton
        
        let closeButton = UIBarButtonItem(image: .menu, style: .plain, target: self,
                                              action: #selector(didTapClose) )
        closeButton.tintColor = .black
        navigationItem.rightBarButtonItem = closeButton
        
        bottomPanelView.snp.makeConstraints({ item in
            item.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            item.height.equalTo(55)
            item.left.equalToSuperview()
            item.right.equalToSuperview()
        })
   
    }

    @objc
    private func didTapMenu() {
      //  navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func didTapClose() {
    
    }
    
}

