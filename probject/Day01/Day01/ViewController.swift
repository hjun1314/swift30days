//
//  ViewController.swift
//  Day01
//
//  Created by hjun on 2020/8/25.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let timeInterval = 0.1
class ViewController: UIViewController {
    var isTiming : Bool = false
           var currentTime : Double = 0.03
           var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        view.addSubview(playBtn)
        view.addSubview(timeLab)
        view.addSubview(resetBtn)
    }
    
    @objc func playBtnClick(){
        if isTiming {
            isTiming = false
            playBtn.setImage(UIImage(named: "play"), for: .normal)
            timer?.invalidate()
        }else {
            isTiming = true
            playBtn.setImage(UIImage(named: "pause"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func resetBtnAction(){
        if !isTiming {
            timeLab.text = "0.0"
            currentTime = 0
        }
    }
    @objc func timerAction() {
        currentTime += timeInterval
        timeLab.text = String.init(format: "%.1f", currentTime)
    }
    
    lazy var playBtn: UIButton = {
        let playBtn = UIButton(frame: CGRect(x: screenWidth * 0.5, y: screenHeight * 0.5, width: screenWidth * 0.5, height: screenHeight * 0.5))
        playBtn.backgroundColor = UIColor(red: 11/255.0, green: 234/255.0, blue: 119/255.0, alpha: 1)
        playBtn.setImage(UIImage(named: "play"), for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnClick), for: .touchUpInside)
        
        return playBtn
    }()
    //计时器label
    lazy var timeLab : UILabel = {
        let timeLab = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth , height: screenHeight * 0.5))
        timeLab.font = .systemFont(ofSize: 88)
        timeLab.textAlignment = .center
        timeLab.textColor = .white
        timeLab.backgroundColor = .brown
        timeLab.text = "0.0"
        return timeLab
    }()
    //重置按钮
    lazy var resetBtn : UIButton = {
        let resetBtn = UIButton(frame: CGRect(x: 0, y: screenHeight * 0.5, width: screenWidth * 0.5, height: screenHeight * 0.5))
        resetBtn.setTitle("重置", for: .normal)
        resetBtn.titleLabel?.font = .systemFont(ofSize: 50, weight: .ultraLight)
        resetBtn.backgroundColor = .red
        resetBtn.addTarget(self, action: #selector(resetBtnAction), for: .touchUpInside)
        return resetBtn
    }()

}

