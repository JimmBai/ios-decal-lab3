//
//  ViewController.swift
//  stopWatch
//
//  Created by Jim Bai on 2017/2/16.
//  Copyright © 2017年 Jim Bai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var watchLabel: UILabel!
    @IBOutlet var timeDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.layer.borderColor = UIColor(red:0.0/255.0, green:0.0/255.0, blue:255.0/255.0, alpha:1).cgColor
        stopButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        stopButton.layer.borderColor = UIColor(red:255.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha:1).cgColor
        watchLabel.adjustsFontSizeToFitWidth = true
        timeDisplay.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var currentWatch: stopWatch?
    var timer:Timer?
    
    @IBAction func startWatch(_ sender: UIButton) {
        self.TerminateWatch(sender)
        currentWatch = stopWatch()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector:#selector(ViewController.updateTimeDisplay(_:)), userInfo:nil, repeats:true)
    }
    
    func updateTimeDisplay(_ timer: Timer) {
        timeDisplay.text = currentWatch?.getTime()
    }
    
    @IBAction func TerminateWatch(_ sender: UIButton) {
        if let timeIns = timer {
            timeIns.invalidate()
            timer = nil
        }
    }
}

