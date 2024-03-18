//
//  ViewController.swift
//  ColorViewGradient
//
//  Created by Dmitry Parhomenko on 03.03.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsControllerDelegate?
    var color: UIColor?
    
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
        
    }
    
    
    
    // MARK: - IBAction
    
    @IBAction func actionSlider(_ sender: UISlider) {
    }
    
    @IBAction func actionDoneButton() {
    
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
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
        let color = CIColor(color: color ?? .white)
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
    
    
}


  
    

