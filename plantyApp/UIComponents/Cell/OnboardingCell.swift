//
//  OnboardingCell.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit
import TinyConstraints

public class OnboardingCell: UICollectionViewCell, ReusableView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Medium", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        label.numberOfLines = 2
        label.textColor = UIColor(white: 0, alpha: 0.6)
        return label
    }()
    
    lazy var imgImageView: UIImageView =  {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
    
    public override func prepareForReuse() {
        super.prepareForReuse()

    }
}

// MARK: - UILayout
extension OnboardingCell {
    
    private func addSubviews() {
        addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 24
        titleLabel.trailingToSuperview().constant = -24
        titleLabel.topToSuperview().constant = 55
        titleLabel.height(60)
        
        addSubview(subtitle)
        subtitle.leadingToSuperview().constant = 24
        subtitle.topToBottom(of: titleLabel).constant = 10
        subtitle.trailingToSuperview().constant = -24
        
        addSubview(imgImageView)
        imgImageView.topToBottom(of: subtitle).constant = 20
        imgImageView.leadingToSuperview()
        imgImageView.trailingToSuperview()
        imgImageView.bottomToSuperview()
    }
}

// MARK: - Configure & SetLocalize
extension OnboardingCell {
    
    private func configureContents() {
        
    }
}
