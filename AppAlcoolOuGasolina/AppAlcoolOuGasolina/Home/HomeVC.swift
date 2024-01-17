//
//  HomeVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 16/01/24.
//

import UIKit

class HomeVC: UIViewController {

    weak var coordinator: MainCoordinator?
    private let myView = HomeScreen()
    
    override func loadView() {
        self.view = self.myView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupButtonsAction()
    }
    
    func setupNavigationBar() {
           self.title = "Home"
           self.navigationController?.navigationBar.prefersLargeTitles = true
       }
    
    func setupButtonsAction() {
        self.myView.tappedStatButton(target: self, action: #selector(self.tappedStatButton(_:)))
      }
      
      @IBAction func tappedStatButton(_ sender: Any) {
          coordinator?.calculator()
      }
}

extension HomeVC: HomeScreenDelegate {
    func tappedStartButton() {
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
