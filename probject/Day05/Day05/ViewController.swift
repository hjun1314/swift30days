//
//  ViewController.swift
//  Day05
//
//  Created by hjun on 2020/8/27.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
import CoreLocation
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
class ViewController: UIViewController, CLLocationManagerDelegate {
    var isLocation:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationLab)
        view.addSubview(locationBtn)
    }
    
  @objc  func locationBtnAction()  {
    if isLocation {
        locationBtn.setTitle("Find my Location", for: .normal)
        locationManager.stopUpdatingLocation()
        isLocation = false
    }else {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationBtn.setTitle("Stop", for: .normal)
        isLocation = true
    }
    }
    
    lazy var locationLab : UILabel = {
        let locationLab = UILabel.init(frame: CGRect(x: 10, y: 100, width: screenWidth - 100, height: 30))
        locationLab.textColor = .black
        locationLab.font = UIFont.systemFont(ofSize: 15)
        locationLab.textAlignment = .center
        locationLab.text = "my Location"
        return locationLab
    }()
    lazy var locationBtn:UIButton = {
        let locationBtn = UIButton.init(type: .custom)
        locationBtn.frame = CGRect(x: 15, y: screenHeight - 100, width: screenWidth - 30, height: 70)
        locationBtn.setTitle("Find My Location", for: .normal)
        locationBtn.backgroundColor = .cyan
        locationBtn.layer.cornerRadius = 35;
        locationBtn.layer.masksToBounds = true
        locationBtn.addTarget(self, action: #selector(locationBtnAction), for: .touchUpInside);
        return locationBtn
    }()
    //定位管理器
    lazy var locationManager : CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        return locationManager
        
    }()
    //地理编码
    lazy var locationGeo: CLGeocoder = {
       let locationGeo = CLGeocoder()
        return locationGeo
    }()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            locationGeo.reverseGeocodeLocation(locations.first!) { (marks, error) in
                if error != nil {
                    self.locationLab.text = "\(error?.localizedDescription ?? "")"
                    return
                }
                if let mark = marks?.first {
                    self.locationLab.text = "\(mark.locality ?? "")\(mark.subLocality ?? "")\(mark.thoroughfare ?? "")"
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLab.text = "error: \(error.localizedDescription)"

    }

}

