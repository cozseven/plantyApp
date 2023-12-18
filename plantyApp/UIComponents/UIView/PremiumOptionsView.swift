//
//  PremiumOptionsView.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit

public class PremiumOptionsView: UIView, ReusableView {

    private var radioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "radioPassive"), for: .normal)
        button.setImage(UIImage(named: "radioActive"), for: .selected)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        label.textColor = .white
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Regular", size: 12)
        label.textColor = UIColor(white: 1, alpha: 0.3)
        return label
    }()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    var didTapped: (() -> Void)?

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    var isChecked: Bool {
        return radioButton.isSelected
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UILayout
extension PremiumOptionsView {
    
    private func addSubviews() {
        addSubview(radioButton)
        radioButton.centerYToSuperview()
        radioButton.leadingToSuperview().constant = 16
        radioButton.height(24)
        radioButton.width(24)
        
        addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 13
        titleLabel.leadingToTrailing(of: radioButton).constant = 12
        titleLabel.trailingToSuperview().constant = -12
        
        addSubview(subtitleLabel)
        subtitleLabel.topToBottom(of: titleLabel).constant = 2
        subtitleLabel.leadingToTrailing(of: radioButton).constant = 12
        subtitleLabel.trailingToSuperview().constant = -12

    }
}

// MARK: - Configure & SetLocalize
extension PremiumOptionsView {
    
     func setSelectedOption() {
         layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.16, green: 0.69, blue: 0.43, alpha: 1).cgColor
        backgroundColor = .clear
         radioButton.isSelected = true
    }
    
     func setPassiveOption() {
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        backgroundColor = UIColor(white: 1, alpha: 0.08)
         radioButton.isSelected = false
    }
    
    private func configureContents() {
        backgroundColor = UIColor(white: 1, alpha: 0.08)
        layer.borderWidth = 0.4
        layer.cornerRadius = 14
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        radioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Action
extension PremiumOptionsView {
    
    @objc
    func radioButtonTapped() {
        radioButton.isSelected = !radioButton.isSelected
        if isChecked {
            setSelectedOption()
        } else {
            setPassiveOption()
        }
        didTapped?()
    }
}
