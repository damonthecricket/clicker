//
//  MainViewController.swift
//  Clicker
//
//  Created by Damon Cricket on 22.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    struct Constants {
        static let clickTime: Int = 30
    }
    
    @IBOutlet weak var timerLabel: UILabel?
    @IBOutlet weak var clickLabel: UILabel?
    @IBOutlet weak var clickButton: UIButton?
    
    var timer: Timer? = nil
    
    deinit {
        stopTimer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        timerLabel?.text = "\(Constants.clickTime)"
        
        clickLabel?.text = "0"
        
        clickButton?.setTitle("Start", for: .normal)
        clickButton?.layer.borderColor = UIColor(red: 0/255, green: 122/255, blue: 255, alpha: 1.0).cgColor
        clickButton?.layer.borderWidth = 2.0
        clickButton?.layer.cornerRadius = clickButton!.frame.width/2.0
    }
    
    @IBAction func clickButtonTap(sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick(timer:)), userInfo: nil, repeats: true)
            timerLabel?.text = "\(Constants.clickTime)"
            clickLabel?.text = "0"
            clickButton?.setTitle("Click", for: .normal)
        } else {
            let clicks = Int(clickLabel!.text!)!
            clickLabel!.text = "\(clicks + 1)"
        }
    }
    
    @objc func timerTick(timer: Timer) {
        let time = Int(timerLabel!.text!)!
        let remain = time - 1
        timerLabel?.text = "\(remain)"
        if remain == 0 {
            stopTimer()
            clickButton?.setTitle("Start", for: .normal)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
