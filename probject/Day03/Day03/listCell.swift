//
//  listCell.swift
//  Day03
//
//  Created by hjun on 2020/8/26.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

struct VideoModel {
    var image : String
    var title : String
    var source : String
}


class listCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil){
            self.selectionStyle = .none
            contentView.addSubview(preview)
            contentView.addSubview(titleLab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellModel : VideoModel! {
        didSet{
            titleLab.text = cellModel.title
            preview.image = UIImage(named: cellModel.image)
        }
    }
    
    
    //预览图
    lazy var preview: UIImageView = {
        let preview = UIImageView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 200))
        return preview
    }()
    //影片标题
    lazy var titleLab: UILabel = {
        let titleLab = UILabel.init(frame: CGRect.init(x: (screenWidth-200)*0.5, y: 200-50, width: 200, height: 30))
        titleLab.textColor = .white
        titleLab.font = .systemFont(ofSize: 14)
        titleLab.textAlignment = .center
        return titleLab
    }()
    //播放
    lazy var playIcon : UIImageView = {
        let playIcon = UIImageView.init(frame: CGRect.init(x: (screenWidth-80)*0.5, y: 60, width: 80, height: 80))
        playIcon.image = UIImage(named: "playBtn")
        return playIcon
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
