//
//  MainCoordinator.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 17/01/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func calculator() {
        let vc = CalculatorVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func result(ethanolPrice: Double, gasPrice: Double) {
        if ethanolPrice / gasPrice > 0.7 {
            print("Melhor utilizar Gasolina")
            let vc = ResultVC(bestFuel: .gas)
            vc.coordinator = self
            navigationController.pushViewController(vc , animated: true)
        } else {
            print("Melhor utilizar Álcool")
            let vc = ResultVC(bestFuel: .ethanol)
            vc.coordinator = self
            navigationController.pushViewController(vc , animated: true)
        }
    }
    
    func backView() {
        navigationController.popViewController(animated: true)
    }
    
    func backToRootView() {
        navigationController.popToRootViewController(animated: true)
    }
    
}

extension MainCoordinator: CalculatorScreenDelegate {
    func tappedCalculateButton() {
         
    }
    
    func tappedBackButton() {
         
    }
    
    
}
