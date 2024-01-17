//
//  ResultVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 16/01/24.
//

import UIKit

class ResultVC: UIViewController {

    weak var coordinator: MainCoordinator?
    private let myView = ResultScreen()
    var bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupButtonsAction()
//        screen?.delegate(delegate: self)
        myView.resultLabel.text = bestFuel.rawValue
    }
    
    func setupNavigationBar() {
           self.title = "Result"
           self.navigationController?.navigationBar.prefersLargeTitles = true
       }
    
    func setupButtonsAction() {
        self.myView.tappedCalculateButton(target: self, action: #selector(self.tappedCalculateButton(_:)))
          self.myView.tappedBackButton(target: self, action: #selector(self.tappedBackButton(_:)))
      }
      
      @IBAction func tappedCalculateButton(_ sender: Any) {
          coordinator?.backToRootView()
      }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        coordinator?.backView()
    }
}

extension ResultVC: ResultScreenDelegate {
    func tappedCalculateButton() {
//        popViewController()
    }
    
    func tappedBackButton() {
//        popViewController()
    }
}
