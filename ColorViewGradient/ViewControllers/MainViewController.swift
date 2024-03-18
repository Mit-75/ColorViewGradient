//
//  FirstViewController.swift
//  ColorViewGradient
//
//  Created by Dmitry Parhomenko on 17.03.2024.
//

import UIKit

protocol SettingsControllerDelegate: AnyObject {
    func setColor(for color: UIColor)
}

final class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.delegate = self
        settingsVC?.color = view.backgroundColor
    }
}

extension MainViewController: SettingsControllerDelegate {
    func setColor(for color: UIColor) {
        view.backgroundColor = color
    }
}
