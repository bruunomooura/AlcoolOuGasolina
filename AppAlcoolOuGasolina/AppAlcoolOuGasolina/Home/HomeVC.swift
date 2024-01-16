//
//  HomeVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 16/01/24.
//

import UIKit

class HomeVC: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

