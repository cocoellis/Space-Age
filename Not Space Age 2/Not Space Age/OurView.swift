//
//  OurView.swift
//  Not Space Age
//
//  Created by Kyle Smith on 10/30/18.
//  Copyright © 2018 smithcoding. All rights reserved.
//

import Foundation
import UIKit

class OurView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    let planets = PlanetCollection()
    var selectedPlanet = Planet(name: "Earth", orbitalRatio: 1.0, demonym: "Earth")
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return planets.milkyWay.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return planets.milkyWay[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPlanet = planets.milkyWay[row+50]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = planets.milkyWay[row].name
        let color = UIColor.white
        let title = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Futura", size: 26.0)!,NSAttributedString.Key.foregroundColor:color])
        return title
    }
    
    
    lazy var ageInputLabel: UILabel = {
        let label = UILabel()
        label.text = "Please input your age!"
        label.textColor = .white
        label.font = UIFont(name: "Futura", size: 18)//.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var ageInput: UITextField = {
        let input = UITextField()
        input.keyboardType = .numberPad
        input.layer.borderColor = UIColor.black.cgColor
        input.layer.borderWidth = 1
        input.textColor = .white
        return input
    }()
    
    lazy var planetInputLabel: UILabel = {
        let label = UILabel()
        label.text = "Pick a planet!"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var planetPickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    lazy var calculateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(calculate), for: .touchDown)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red:0.24, green:0.24, blue:0.22, alpha:1.0)
        setupViews()
    }
    
    @objc func calculate() {
        planetPickerView.isHidden = planetPickerView.isHidden ? false : true
        if let age = ageInput.text {
            if age != "" {
                let ageInSeconds = ageToSeconds(ageInYears: Int(age)!)
                let planetAge = selectedPlanet.ageToPlanetYears(ageInEarthSeconds: ageInSeconds)
                calculateLabel.text = "You are \(planetAge) in \(selectedPlanet.demonym) years"
            } else {
                calculateLabel.text = "Please enter your age!"
            }
        }
    }
    
    func ageToSeconds(ageInYears: Int) -> Float {
        return Float(ageInYears) * selectedPlanet.earthYearInSeconds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(ageInputLabel)
        addSubview(ageInput)
        addSubview(planetInputLabel)
        addSubview(planetPickerView)
        addSubview(calculateLabel)
        addSubview(calculateButton)
        
        _ = ageInputLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 48, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 25)
        
        ageInputLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        _ = ageInput.anchor(ageInputLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 25)
        
        ageInput.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        _ = planetInputLabel.anchor(ageInput.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 96, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 25)
        planetInputLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        _ = planetPickerView.anchor(planetInputLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 196)
        planetPickerView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        _ = calculateButton.anchor(nil, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 36, rightConstant: 0, widthConstant: 100, heightConstant: 25)
        
        calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        _ = calculateLabel.anchor(nil, left: nil, bottom: calculateButton.topAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightConstant: 0, widthConstant: 200, heightConstant: 76)
        
        calculateLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
}
