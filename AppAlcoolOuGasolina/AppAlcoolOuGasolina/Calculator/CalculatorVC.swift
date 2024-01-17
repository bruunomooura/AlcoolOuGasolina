//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 16/01/24.
//

import UIKit

class CalculatorVC: UIViewController {
    
    weak var coordinator: MainCoordinator?
    private let myView = CalculatorScreen()
    var alert: Alert?
    
    var ethanolPrice: Double = 0
    var gasPrice: Double = 0
    
    override func loadView() {
        self.view = self.myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.setupNavigationBar()
        self.setupButtonsAction()
        alert = Alert(controller: self)
    }
    
    func setupNavigationBar() {
           self.title = "Calculator"
           self.navigationController?.navigationBar.prefersLargeTitles = true
       }
    
    func setupButtonsAction() {
        self.myView.tappedCalculateButton(target: self, action: #selector(self.tappedCalculateButton(_:)))
          self.myView.tappedBackButton(target: self, action: #selector(self.tappedBackButton(_:)))
      }
      
      @IBAction func tappedCalculateButton(_ sender: Any) {
          tappedCalculateButton()
          coordinator?.result(ethanolPrice: ethanolPrice, gasPrice: gasPrice)
      }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        coordinator?.backView()
    }
        
    func validateTextFields() -> Bool {
        guard let ethanolPrice = myView.ethanolPriceTextField.text else { return false }
        guard let gasPrice = myView.gasPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valores do álcool e da gasolina")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe o valor do álcool")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe o valor da gasolina")
            return false
        }
        return true
    }
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            ethanolPrice = (formatter.number(from: myView.ethanolPriceTextField.text ?? "0.0") as? Double ?? 0.0)
            
            gasPrice = (formatter.number(from: myView.gasPriceTextField.text ?? "0.0") as? Double ?? 0.0)
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
