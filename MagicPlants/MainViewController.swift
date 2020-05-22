//
//  ViewController.swift
//  MagicPlants
//
//  Created by Татьяна Севостьянова on 18.05.2020.
//  Copyright © 2020 Татьяна Севостьянова. All rights reserved.
//

import UIKit
import SnapKit

struct Item {
    
    let image: UIImage
    let name: String
    let price: String
    let size: String
    let fonColor: UIColor
}

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let listItem: [Item] = [
        Item(image: .img9, name: "Pachira", price: "From $25", size: "75cm"),
        Item(image: .img7, name: "Zamiokulkas", price: "From $25", size: "75cm"),
        Item(image: .img8, name: "Zamiokulkas", price: "From $25", size: "75cm"),
        Item(image: .img6, name: "Chrysalidocarpus", price: "From $25", size: "75cm"),
        Item(image: .img4, name: "Strelitzia", price: "From $25", size: "75cm"),
        Item(image: .img3, name: "Dracaena", price: "From $35", size: "75cm"),
        Item(image: .img10, name: "Peperomy", price: "From $25", size: "75cm")
    ]
    
    lazy var bottomPanelView: NavigationView = {
        let view = NavigationView(navigationController: self.navigationController!)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 216, height: 331)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 31
        layout.sectionInset.bottom = 100
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(bottomPanelView)
        view.addSubview(collectionView)
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        collectionView.dataSource = self
        collectionView.delegate = self
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
        
        let closeButton = UIBarButtonItem(image: .close, style: .plain, target: self,
                                          action: #selector(didTapClose) )
        closeButton.tintColor = .black
        navigationItem.rightBarButtonItem = closeButton
        
        collectionView.snp.makeConstraints({ item in
            item.left.equalToSuperview().offset(20)
            item.right.equalToSuperview().offset(-20)
            item.bottom.equalTo(bottomPanelView.snp.top)
            item.top.equalToSuperview().offset(80)
        })
        
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

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //  return listItem.count
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        (cell as? ItemCell)?.imageView.image = listItem[indexPath.row].image
        (cell as? ItemCell)?.nameLabel.text = "\(listItem[indexPath.row].name)"
        (cell as? ItemCell)?.priseLabel.text = "\(listItem[indexPath.row].price)"
        (cell as? ItemCell)?.sizeLabel.text = "\(listItem[indexPath.row].size)"
        cell.backgroundColor = .clear
       // cell.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
      //  cell.layer.borderWidth = 0.5
     //   cell.layer.cornerRadius = 20
    
        
        
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Я выбралаа ячейку с номером \(indexPath.row)")
    }
}
