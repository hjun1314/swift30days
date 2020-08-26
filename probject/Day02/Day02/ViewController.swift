//
//  ViewController.swift
//  Day02
//
//  Created by hjun on 2020/8/26.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    let fonts = ["MFJunYa_Noncommercial-Regular",
                 "MF-TongZhen-Noncommercial-Regular",
                 "MFYueHei_Noncommercial-Regular"]
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textView)
        view.addSubview(changeBtn)
    }

    
    @objc func changeBtnAction() {
        index = (index + 1)%fonts.count
        textView.font = UIFont.init(name: fonts[index], size: 18)
    }
    
    lazy var textView : UITextView = {
        let textView = UITextView.init(frame: CGRect(x: 28, y: 100, width: screenWidth - 56, height: screenHeight - 100))
        textView.backgroundColor = .darkText
        textView.font = UIFont.init(name: "MFYueHei_Noncommercial-Regular", size: 18)
        textView.textColor = .red
        textView.text = """
        自定义字体
        哈哈哈
        哈哈哈
"""
        return textView
    }()
    
    lazy var changeBtn : UIButton = {
        let changeBtn = UIButton.init(type: .custom)
        changeBtn.frame = CGRect(x: screenWidth / 2 - 40, y: screenHeight - 100 + 10 , width: 80, height: 80)
        changeBtn.backgroundColor = .blue
        changeBtn.addTarget(self, action: #selector(changeBtnAction), for: .touchUpInside)
        changeBtn.setTitleColor(.white, for: .normal)
        changeBtn.clipsToBounds = true
        changeBtn.layer.cornerRadius = 40
        changeBtn.titleLabel?.font = UIFont.init(name: "MFJunYa_Noncommercial-Regular", size: 20)
        changeBtn.setTitle("change font", for: .normal)
        return changeBtn
    }()

}

