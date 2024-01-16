//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 16/01/24.
//

import UIKit

class CalculatorVC: UIViewController {

    var screen: CalculatorScreen?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}
