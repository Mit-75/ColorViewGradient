//
//  FirstViewController.swift
//  ColorViewGradient
//
//  Created by Dmitry Parhomenko on 17.03.2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func setColor(for color: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
extension MainViewController: MainViewControllerDelegate {
    
}
