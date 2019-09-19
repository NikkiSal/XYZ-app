//
//  ViewController.swift
//  XYZ
//
//  Created by Marzieh on 2019-09-19.
//  Copyright © 2019 Myph. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var XLabel: UILabel!
    @IBOutlet weak var YLabel: UILabel!
    @IBOutlet weak var ZLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
        }
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }
        
        let formatter = NumberFormatter ()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        XLabel.text = "X: \(x)"
        YLabel.text = "Y: \(y)"
        ZLabel.text = "Z: \(z)"
    }

}

