//
//  listCell.swift
//  Day04
//
//  Created by hjun on 2020/8/27.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
let cellWidth = 300
let cellHeight = 450

struct listCellModel {
    var image : String
    var title : String
}


class listCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if !self.isEqual(nil) {
            contentView.addSubview(imageView)
            contentView.addSubview(blurEffectView)
            blurEffectView.contentView.addSubview(titleLab)
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellModel : listCellModel! {
        didSet{
            imageView.image = UIImage.init(named: cellModel.image)
            titleLab.text = cellModel.title
        }
    }
    
    
    //MARK: - 懒加载
    //图片
    lazy var imageView : UIImageView = {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //毛玻璃
    lazy var blurEffectView : UIVisualEffectView = {
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurEffectView = UIVisualEffectView.init(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: cellHeight - 50, width: cellWidth, height: 50)
        return blurEffectView
    }()
    //标题
    lazy var titleLab : UILabel = {
        let titleLab = UILabel.init(frame: CGRect(x: 10, y: 10, width: cellWidth - 20, height: 30))
        titleLab.font = UIFont.systemFont(ofSize: 16)
        titleLab.textColor = .white
        return titleLab
    }()
    
}
