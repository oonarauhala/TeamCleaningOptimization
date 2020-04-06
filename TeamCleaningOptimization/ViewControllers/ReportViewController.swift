//
//  ReportViewController.swift
//  TeamCleaningOptimization
//
//  Created by Artur Kulagin on 1.4.2020.
//  Copyright © 2020 TeamCleaningOptimization. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    var roomNumb = String()
    var cleaner  = "Leonardo DiCpario"
    var time     = "0:30:56"
    var cleanInd = "95"
    var success  = "Yes"
    
    @IBOutlet weak var rCleanerTF:  UITextField!
    @IBOutlet weak var rTimeTF:     UITextField!
    @IBOutlet weak var rCleanIndTF: UITextField!
    @IBOutlet weak var rSuccessTF:  UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Report \(roomNumb)"
        
        rCleanerTF.text  = cleaner
        rTimeTF.text     = time
        rCleanIndTF.text = cleanInd
        rSuccessTF.text  = success
    }
    
    //prepare function to pass data between two ViewControllers
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowRoomInfo"){
            
          guard let destViewController = segue.destination as? RoomInfoViewController else {return}
          destViewController.getNumber = roomNumb
            
        }
    }
    
    
}
