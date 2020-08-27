//
//  ViewController.swift
//  Day04
//
//  Created by hjun on 2020/8/27.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let cellid = "cellid"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        as! listCell
        cell.cellModel = datas[indexPath.item]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgView)
        view.addSubview(collectionView)
        
    }
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize.init(width:cellWidth , height:cellHeight)
        let collectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(listCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.contentInset = UIEdgeInsets.init(top: 50, left: 50, bottom: 50, right: 50)
        return collectionView
    }()
    
    lazy var bgView : UIImageView = {
        let bgView = UIImageView.init(frame: view.bounds)
        bgView.image = UIImage.init(named: "blue")
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurEffectView = UIVisualEffectView.init(effect: blurEffect)
        blurEffectView.frame = bgView.frame
        bgView.addSubview(blurEffectView)
        return bgView
    }()
    
    lazy var datas : [listCellModel] = {
        let datas = [ listCellModel(image:"hello", title: "Hello there, i miss u."),
               listCellModel(image:"dudu", title: "🐳🐳🐳🐳🐳"),
               listCellModel(image:"bodyline", title: "Training like this, #bodyline"),
               listCellModel(image:"wave", title: "I'm hungry, indeed."),
               listCellModel(image:"darkvarder", title: "Dark Varder, #emoji"),
    ]
        return datas
    
    }()

}

