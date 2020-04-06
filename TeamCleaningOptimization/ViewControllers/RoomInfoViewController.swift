//
//  ViewController.swift
//  TeamCleaningOptimization
//
//  Created by Katja on 25.3.2020.
//  Copyright © 2020 TeamCleaningOptimization. All rights reserved.
//

import UIKit

class RoomInfoViewController: UIViewController {
    
    var isCleaning = false
    var getNumber = String()
    var timer: Timer!
    var time = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.isHidden = true
        self.title = "Room " + getNumber
        changeButtons()
    }
    
    // Timer calls this every second
    @objc func countTime() {
        time += 1
        timeLabel.text = String(time)
        print(time)
    }
    
    // Changes start and stop cleaning buttons. Disables back navigation for timer to work correctly
    func changeButtons() {
        if isCleaning {
            self.navigationItem.hidesBackButton = true
            cleanedButton.isHidden = false
            startButton.isHidden = true
        }
        else {
            self.navigationItem.hidesBackButton = false
            cleanedButton.isHidden = true
            startButton.isHidden = false
        }
    }
    
    //MARK: Actions

    @IBOutlet weak var startButton: RoundButton!
    @IBAction func startButtonClicked(_ sender: UIButton) {
        isCleaning = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        timeLabel.isHidden = false
        changeButtons()
    }
    
    @IBOutlet weak var cleanedButton: RoundButton!
    @IBAction func cleanedButtonClicked(_ sender: UIButton) {
        isCleaning = false
        timer.invalidate()
        print("Timer stopped")
        changeButtons()
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func scheduleButtonClicked(_ sender: UIButton) {
      
}

//prepare function to pass data between two ViewControllers
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "ShowReport"){
       guard let destViewController = segue.destination as? ReportViewController else {return}
       destViewController.roomNumb = getNumber }
        }

        }
