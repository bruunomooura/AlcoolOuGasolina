//
//  HomeScreen.swift
//  AppAlcoolOuGasolina
//
//  Created by Bruno Moura on 16/01/24.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
}

class HomeScreen: UIView {
    
    
        
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG HOME")
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var statButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        return button
    }()
    
    @objc func statButton(_ sender: UIButton) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(statButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoAppImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            statButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            statButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            statButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            statButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
