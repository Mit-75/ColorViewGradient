//
//  ViewController.swift
//  ColorViewGradient
//
//  Created by Dmitry Parhomenko on 03.03.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsControllerDelegate?
    var mainColor: UIColor?
    
    // MARK: - IB Outlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    
    // MARK: - Ovverides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 10
        colorView.backgroundColor = mainColor
        
        setValue(for: redSlider, greenSlider, blueSlider )
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    
    @IBAction func actionSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
        }
        setColorView()
    }
    
    @IBAction func actionDoneButton() {
        delegate?.setColor(for: colorView.backgroundColor ?? .gray)
        dismiss(animated: true)
    }
}
// MARK: - Private Methods
extension SettingsViewController {
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = setString(for: redSlider)
            case greenLabel:
                greenLabel.text = setString(for: greenSlider)
            default:
                blueLabel.text = setString(for: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = setString(for: redSlider)
            case greenTextField:
                greenTextField.text = setString(for: greenSlider)
            default:
                blueTextField.text = setString(for: blueSlider)
            }
        }
    }
    
    private func setValue(for sliders: UISlider...) {
        let color = CIColor(color: mainColor ?? .white)
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(color.red)
            case greenSlider:
                greenSlider.value = Float(color.green)
            default:
                blueSlider.value = Float(color.green)
            }
        }
    }
    
    private func setString(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

