//
//  ViewController.swift
//  Day03
//
//  Created by hjun on 2020/8/26.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
import AVKit
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
fileprivate let videoListCellID = "videoListCellID"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "视频列表"
        view.addSubview(tableView)

    }
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: view.bounds)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(listCell.self, forCellReuseIdentifier: videoListCellID)
        return tableView
    }()
    
    lazy var datas : [VideoModel] = {
     let datas = [
              VideoModel(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
              VideoModel(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
              VideoModel(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
              VideoModel(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
              VideoModel(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
              VideoModel(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
              ]
        return datas
    }()
  

}
//MARK: TableVideDelegate&DataSource
  extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVc = AVPlayerViewController.init()
        let path = Bundle.main.path(forResource: "L", ofType: "mp4")
        playerVc.player = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
        self.present(playerVc, animated: true) {
            playerVc.player?.play()
        }
    }
  }
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: videoListCellID, for: indexPath)as! listCell
        cell.cellModel = datas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

