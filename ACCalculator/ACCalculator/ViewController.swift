//
//  ViewController.swift
//  ACCalculator
//
//  Created by Jake SWEDENBURG on 9/19/16.
//  Copyright © 2016 Jake Swedenbug. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Outlets
    @IBOutlet weak var enteredNumber: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var leftNumberLabel: UILabel!
    @IBOutlet weak var leftUnitsLabel: UILabel!
    @IBOutlet weak var rightNumberLabel: UILabel!
    @IBOutlet weak var rightUnitsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredNumber.delegate = self
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let number = Float(string) else { return false }
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let kwTonEff = KwPerTon(kwPerTon: number)
            rightNumberLabel.text = String(kwTonEff.cop)
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = String(kwTonEff.eer)
            leftUnitsLabel.text = "EER"
        case 1:
            print("hey")
        case 2:
            print("hey")
        default:
            print("not right")
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}

