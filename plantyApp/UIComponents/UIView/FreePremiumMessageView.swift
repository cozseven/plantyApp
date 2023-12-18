//
//  FreePremiumMessageView.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit

public class FreePremiumMessageView: UIView, ReusableView {

    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "freeprem")
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Medium", size: 14)
        label.textColor = .yellow
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Medium", size: 13)
        label.textColor = .yellow
        return label
    }()
    let chevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow"))
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UILayout
extension FreePremiumMessageView {
    
    private func addSubviews() {
        addSubview(userImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(chevronImageView)
                
        userImageView.centerYToSuperview()
        userImageView.leadingToSuperview().constant = 10
        userImageView.width(44)
        userImageView.height(44)
        
        titleLabel.centerY(to: userImageView).constant = -12
        titleLabel.leadingToTrailing(of: userImageView).constant = 10
        titleLabel.trailingToSuperview().constant = -20
        
        subtitleLabel.topToBottom(of: titleLabel).constant = 5
        subtitleLabel.leadingToTrailing(of: userImageView).constant = 10
        subtitleLabel.trailingToSuperview().constant = -20
        
        chevronImageView.centerYToSuperview()
        chevronImageView.trailingToSuperview().constant = -10
        chevronImageView.width(30)
        chevronImageView.height(30)
    }
}

// MARK: - Configure & SetLocalize
extension FreePremiumMessageView {
    
    private func configureContents() {
        layer.cornerRadius = 12
        titleLabel.text = "FREE Premium Account"
        subtitleLabel.text = "Tap to uograde your account!"
        backgroundColor = .black
    }
}
