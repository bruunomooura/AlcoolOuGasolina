//
//  Coordinator.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 17/01/24.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
