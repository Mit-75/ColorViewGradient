//
//  ViewController.swift
//  ColorViewGradient
//
//  Created by Dmitry Parhomenko on 03.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var mainColorView: UIView!
    
   
    @IBOutlet var redView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var blueView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Pablic Properties
    
    // MARK: - Private Properties
    
    // MARK: - Ovverides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getSetupUI()
        getViewGradient()
    }
    
    // MARK: - IB Actions
    
    @IBAction func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        getViewGradient()
        
    }
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        getViewGradient()
       
    }
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        getViewGradient()
       
    }
   
}
extension MainViewController {
    
    private func getSetupUI() {
        redSlider.value = 0.1
        greenSlider.value = 0.5
        blueSlider.value = 0.9
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }
    
    private func getViewGradient() {
        mainColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
            )
    }
    
}

