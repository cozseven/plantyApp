//
//  FeatureCell.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit
import TinyConstraints

public class FeatureCell: UICollectionViewCell, ReusableView {
    

    var backgroundOverlayView: UIView =  {
       let view = UIView()
       return view
    }()
    
    let backgroundImageView: UIImageView =  {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        imageView.layer.cornerRadius = 5
       return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 15)
        label.textColor = UIColor(white: 1, alpha: 0.3)
        return label
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
        titleLabel.text = ""
        subtitleLabel.text = ""
        backgroundImageView.image = nil
    }
}

// MARK: - UILayout
extension FeatureCell {
    
    private func addSubviews() {
        addSubview(backgroundOverlayView)
        backgroundOverlayView.edgesToSuperview()
        backgroundOverlayView.addSubview(backgroundImageView)
        backgroundImageView.topToSuperview().constant = 16
        backgroundImageView.leadingToSuperview().constant = 16
        backgroundImageView.height(36)
        backgroundImageView.width(36)
        backgroundOverlayView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 16
        titleLabel.topToBottom(of: backgroundImageView).constant = 16
        titleLabel.height(20)
        titleLabel.trailingToSuperview().constant = -16
        backgroundOverlayView.addSubview(subtitleLabel)
        subtitleLabel.leadingToSuperview().constant = 16
        subtitleLabel.topToBottom(of: titleLabel).constant = 3
        subtitleLabel.trailingToSuperview().constant = -16
        subtitleLabel.height(20)
        backgroundOverlayView.backgroundColor = UIColor(white: 1, alpha: 0.08)
    }
}

// MARK: - Configure & SetLocalize
extension FeatureCell {
    
    private func configureContents() {
        backgroundOverlayView.layer.cornerRadius = 14
    }
}
