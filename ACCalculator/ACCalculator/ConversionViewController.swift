//
//  ViewController.swift
//  ACCalculator
//
//  Created by Jake SWEDENBURG on 9/19/16.
//  Copyright © 2016 Jake Swedenbug. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    var enteredNumber = UITextField()
    var segmentedControl = UISegmentedControl()
    var titleLabel = UILabel()
    var leftNumberLabel = UILabel()
    var leftUnitsLabel = UILabel()
    var rightNumberLabel = UILabel()
    var rightUnitsLabel = UILabel()
    var topStackView = UIStackView()
    
    //MARK: Colors
    let backgroundColor = UIColor(red: 14/255, green: 54/255, blue: 80/255, alpha: 1.0)
    let enteredNumberColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1.0)
    let segmentSelectedColor = UIColor(red: 84/255, green: 106/255, blue: 127/255, alpha: 1)
    let centerRadiantColor = UIColor(red: 36/255, green: 90/255, blue: 117/255, alpha: 1.0)
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredNumber.delegate = self
        enteredNumber.becomeFirstResponder()
        self.enteredNumber.keyboardType = UIKeyboardType.decimalPad
        let center = CGPoint(x: view.bounds.width / 2.0, y: view.bounds.height/4)
        let gradient = RadialGradientLayer(center: center, radius: self.view.bounds.width/2, colors: [centerRadiantColor.cgColor, backgroundColor.cgColor])
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, at: 1)
        gradient.setNeedsDisplay()
        
        setupTextField()
        setupLabels()
        setupSegmentedControl()
        setupStackView()
        setupConstraints()
    }
    
    // MARK: Helper functions to setup View
    func setupLabels() {
        leftUnitsLabel.translatesAutoresizingMaskIntoConstraints = false
        leftNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        rightNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        rightUnitsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "A/C Efficiency"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "PaulGrotesk-Regular-Trail", size: 24)
        
        let unitsFont = UIFont(name: "PaulGrotesk-Regular-Trail", size: 26)
        let numbersFont = UIFont(name: "PaulGrotesk-Regular-Trail", size: 48)
        leftUnitsLabel.text = " "
        leftUnitsLabel.textColor = UIColor.white
        leftUnitsLabel.font = unitsFont
        leftUnitsLabel.textAlignment = .center
        
        leftNumberLabel.text = " "
        leftNumberLabel.textColor = UIColor.white
        leftNumberLabel.font = numbersFont
        leftNumberLabel.textAlignment = .center
        leftNumberLabel.sizeToFit()
        
        rightUnitsLabel.text = " "
        rightUnitsLabel.textColor = UIColor.white
        rightUnitsLabel.font = unitsFont
        rightUnitsLabel.textAlignment = .center
        
        rightNumberLabel.text =  " "
        rightNumberLabel.textColor = UIColor.white
        rightNumberLabel.font = numbersFont
        rightNumberLabel.textAlignment = .center

        view.addSubview(leftNumberLabel)
        view.addSubview(leftUnitsLabel)
        view.addSubview(rightUnitsLabel)
        view.addSubview(rightNumberLabel)
    }
    
    func setupTextField() {
        enteredNumber.attributedPlaceholder = NSAttributedString(string: "Enter Here", attributes: [NSForegroundColorAttributeName: enteredNumberColor, NSFontAttributeName: UIFont(name: "PaulGrotesk-Regular-Trail", size: 20 )!])
        enteredNumber.textColor = enteredNumberColor
        enteredNumber.borderStyle = .roundedRect
        enteredNumber.layer.borderColor = enteredNumberColor.cgColor
        enteredNumber.layer.borderWidth = 2.0
        enteredNumber.backgroundColor = backgroundColor
        enteredNumber.textAlignment = .center
    }
    
    func setupSegmentedControl() {
        let segmentTitleFont = UIFont(name: "PaulGrotesk-Regular-Trail", size: CGFloat(16.0))
        segmentedControl.insertSegment(withTitle: "kW/Ton", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "EER", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "COP", at: 2, animated: true)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: segmentTitleFont!], for: .normal)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: segmentTitleFont!], for: .selected)
        segmentedControl.tintColor = segmentSelectedColor
        segmentedControl.addTarget(self, action: #selector(segmentTapped), for: .valueChanged)
    }
    
    func setupStackView() {
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(enteredNumber)
        topStackView.addArrangedSubview(segmentedControl)
        topStackView.axis = .vertical
        topStackView.distribution = .fill
        topStackView.spacing = 10
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.alignment = .center
        self.view.addSubview(topStackView)
        }
    
    //MARK: Constraints Setup
    func setupConstraints() {
        // StackView Constaints
        let stackviewTop = NSLayoutConstraint(item: topStackView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100)
        let stackviewLeading = NSLayoutConstraint(item: topStackView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10)
        let stackviewTrailing = NSLayoutConstraint(item: topStackView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -10)
        let stackviewHeight = NSLayoutConstraint(item: topStackView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height , multiplier: 0, constant: 125)
        let enteredNumberHeight = NSLayoutConstraint(item: enteredNumber, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        // Left Number and Units
        let leftNumbertoStack = NSLayoutConstraint(item: leftNumberLabel, attribute: .top, relatedBy: .equal, toItem: topStackView, attribute: .bottom, multiplier: 1, constant: 50)
        let leftNumberToViewLeading = NSLayoutConstraint(item: leftNumberLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 50)
        let leftNumberHeight = NSLayoutConstraint(item: leftNumberLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 45)
        let leftNumberWidth = NSLayoutConstraint(item: leftNumberLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 125)
        let leftUnitsWidth = NSLayoutConstraint(item: leftUnitsLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0, constant: 125)
        let leftUnitsHeight = NSLayoutConstraint(item: leftUnitsLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 30)
        let leftUnitsToNumber = NSLayoutConstraint(item: leftUnitsLabel, attribute: .top, relatedBy: .equal, toItem: leftNumberLabel, attribute: .bottom, multiplier: 1, constant: 0)
        let leftUnitstoViewLeading = NSLayoutConstraint(item: leftUnitsLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 50)
        
        // Right Number and Units
        let rightNumbertoViewTrailing = NSLayoutConstraint(item: rightNumberLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -50)
        let rightNumbertoStack = NSLayoutConstraint(item: rightNumberLabel, attribute: .top, relatedBy: .equal, toItem: topStackView, attribute: .bottom, multiplier: 1, constant: 50)
        let rightNumberHeight = NSLayoutConstraint(item: rightNumberLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 45)
        let rightNumberWidth = NSLayoutConstraint(item: rightNumberLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 125)
        let rightUnitsToNumber = NSLayoutConstraint(item: rightUnitsLabel, attribute: .top, relatedBy: .equal, toItem: rightNumberLabel, attribute: .bottom, multiplier: 1, constant: 0)
        let rightUnitstoViewLeading = NSLayoutConstraint(item: rightUnitsLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -50)
        let rightUnitsWidth = NSLayoutConstraint(item: rightUnitsLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0, constant: 125)
        let rightUnitsHeight = NSLayoutConstraint(item: rightUnitsLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 30)
        let segmentedControlWidth = NSLayoutConstraint(item: segmentedControl, attribute: .width, relatedBy: .equal, toItem: topStackView, attribute: .width, multiplier: 1, constant: 0)
        
        view.addConstraints([stackviewTop, stackviewLeading, stackviewTrailing, stackviewHeight, leftNumbertoStack, leftNumberToViewLeading, leftNumberHeight, leftNumberWidth, leftUnitsToNumber, leftUnitstoViewLeading, segmentedControlWidth, rightNumbertoViewTrailing, rightNumbertoStack, rightNumberHeight, rightNumberWidth, rightUnitsToNumber, rightUnitstoViewLeading, rightUnitsWidth, rightUnitsHeight, leftUnitsWidth, leftUnitsHeight, enteredNumberHeight])
    }
    
    //MARK: Actions
    func segmentTapped() {
        guard let text = enteredNumber.text else { return }
        let number = Float(text) ?? 0.0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let kwTonEff = KwPerTon(kwPerTon: number)
            rightNumberLabel.text = number == 0.0 ? " " : String(kwTonEff.cop.roundTo(places: 2))
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? " " : String(kwTonEff.eer.roundTo(places: 2))
            leftUnitsLabel.text = "EER"
        case 1:
            let eerEff = Eer(eer: number)
            rightNumberLabel.text = number == 0.0 ? " " : String(eerEff.cop.roundTo(places: 2))
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? " " : String(eerEff.kwPerTon.roundTo(places: 2))
            leftUnitsLabel.text = "kW/Ton"
        case 2:
            let copEff = Cop(cop: number)
            rightNumberLabel.text = number == 0.0 ? " " : String(copEff.kwPerTon.roundTo(places: 2))
            rightUnitsLabel.text = "kW/Ton"
            leftNumberLabel.text = number == 0.0 ? " " : String(copEff.eer.roundTo(places: 2))
            leftUnitsLabel.text = "EER"
        default:
            print("not right")
        }
    }
    
    //MARK: Text Field Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text!.characters.count < 1 ? "0" : textField.text ?? "0"
        let startIndex =  string == "" ? currentText.index(before: currentText.endIndex) : currentText.index(currentText.startIndex, offsetBy: currentText.characters.count)
        let endIndex = currentText.endIndex
        let myRange = startIndex..<endIndex
        let prospectiveText = currentText.replacingCharacters(in: myRange, with: string)
        let number = Float(prospectiveText) ?? 0.0
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let kwTonEff = KwPerTon(kwPerTon: Float(number))
            rightNumberLabel.text = number == 0.0 ? "" : String(kwTonEff.cop.roundTo(places: 2))
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? "" : String(kwTonEff.eer.roundTo(places: 2))
            leftUnitsLabel.text = "EER"
        case 1:
            let eerEff = Eer(eer: Float(number))
            rightNumberLabel.text = number == 0.0 ? " " : String(eerEff.cop.roundTo(places: 2))
            rightUnitsLabel.text = "COP"
            leftNumberLabel.text = number == 0.0 ? " " : String(eerEff.kwPerTon.roundTo(places: 2))
            leftUnitsLabel.text = "kW/Ton"
        case 2:
            let copEff = Cop(cop: Float(number))
            rightNumberLabel.text = number == 0.0 ? " " : String(copEff.kwPerTon.roundTo(places: 2))
            rightUnitsLabel.text = "kW/Ton"
            leftNumberLabel.text = number == 0.0 ? " " : String(copEff.eer.roundTo(places: 2))
            leftUnitsLabel.text = "EER"
        default:
            print("No third case")
        }
        return true
    }
}

