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
    var enteredNumber = UITextField()
    var segmentedControl = UISegmentedControl()
    var titleLabel = UILabel()
    var leftNumberLabel = UILabel()
    var leftUnitsLabel = UILabel()
    var rightNumberLabel = UILabel()
    var rightUnitsLabel = UILabel()
    var stackView = UIStackView()
    
    let backgroundColor = UIColor(red: 14.0/255, green: 54/255, blue: 80/255, alpha: 1.0)
    
    let enteredNumberColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
    
    //let segmentColor = UIColor(red: 84/255, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredNumber.delegate = self
        self.view.backgroundColor = backgroundColor
        setupTextField()
        setupSegmentedControl()
        setupLabels()
        setupStackView()
        setupConstraints()
        
    }
    
    func setupLabels() {
        titleLabel.text = "A/C Efficiency"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "PaulGrotesk-Regular-Trail", size: 18)
        //self.view.addSubview(titleLabel)
    }
    
    func setupTextField() {
        
        enteredNumber.attributedPlaceholder = NSAttributedString(string: "Enter Here", attributes: [NSForegroundColorAttributeName: enteredNumberColor])
        enteredNumber.textColor = enteredNumberColor
        enteredNumber.borderStyle = .roundedRect
        enteredNumber.layer.borderColor = enteredNumberColor.cgColor
        enteredNumber.layer.borderWidth = 2.0
        enteredNumber.backgroundColor = backgroundColor
        enteredNumber.textAlignment = .center
        //self.view.addSubview(enteredNumber)
    }
    
    func setupSegmentedControl() {
        segmentedControl.insertSegment(withTitle: "kW/Ton", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "EER", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "COP", at: 2, animated: true)
        segmentedControl.tintColor = UIColor.white
        //self.view.addSubview(segmentedControl)
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(enteredNumber)
        stackView.addArrangedSubview(segmentedControl)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
            }
    
    func setupConstraints() {
        let textFieldToLabel = NSLayoutConstraint(item: enteredNumber, attribute: .width, relatedBy: .equal, toItem: titleLabel, attribute: .width, multiplier: 1, constant: 0)
        let stackviewTop = NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100)
        let stackviewLeading = NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let stackviewTrailing = NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        //let stackviewBottom = NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100)
        
        view.addConstraints([stackviewTop, stackviewLeading, stackviewTrailing, textFieldToLabel])
    }
    /*
    @IBAction func efficiencyChanged(_ sender: AnyObject) {
        guard let text = enteredNumber.text else { return }
        let number = Float(text) ?? 0.0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let kwTonEff = KwPerTon(kwPerTon: number)
            rightNumberLabel.text = number == 0.0 ? "Value" : String(kwTonEff.cop)
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? "Value" : String(kwTonEff.eer)
            leftUnitsLabel.text = "EER"
        case 1:
            let eerEff = Eer(eer: number)
            rightNumberLabel.text = number == 0.0 ? "Value" : String(eerEff.cop)
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? "Value" : String(eerEff.kwPerTon)
            leftUnitsLabel.text = "kW/Ton"
        case 2:
            let copEff = Cop(cop: number)
            rightNumberLabel.text = number == 0.0 ? "Value" : String(copEff.kwPerTon)
            rightUnitsLabel.text = "kW/Ton"
            leftNumberLabel.text = number == 0.0 ? "Value" : String(copEff.eer)
            leftUnitsLabel.text = "EER"
            
        default:
            print("not right")
            
        }
        
    }
    */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        let currentText = textField.text!.characters.count < 1 ? "0" : textField.text ?? "0"
        
        
        
        let startIndex =  string == "" ? currentText.index(before: currentText.endIndex) : currentText.index(currentText.startIndex, offsetBy: currentText.characters.count)
        
        let endIndex = currentText.endIndex
        
        
        let myRange = startIndex..<endIndex
        
        let prospectiveText = currentText.replacingCharacters(in: myRange, with: string)
        let number = Float(prospectiveText) ?? 0.0
        
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let kwTonEff = KwPerTon(kwPerTon: number)
            rightNumberLabel.text = number == 0.0 ? "Value" : String(kwTonEff.cop)
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? "Value" : String(kwTonEff.eer)
            leftUnitsLabel.text = "EER"
        case 1:
            let eerEff = Eer(eer: number)
            rightNumberLabel.text = number == 0.0 ? "Value" : String(eerEff.cop)
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? "Value" : String(eerEff.kwPerTon)
            leftUnitsLabel.text = "kW/Ton"
        case 2:
            let copEff = Cop(cop: number)
            rightNumberLabel.text = number == 0.0 ? "Value" : String(copEff.kwPerTon)
            rightUnitsLabel.text = "kW/Ton"
            leftNumberLabel.text = number == 0.0 ? "Value" : String(copEff.eer)
            leftUnitsLabel.text = "EER"
            
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

