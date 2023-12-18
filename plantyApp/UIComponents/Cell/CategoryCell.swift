//
//  CategoryCell.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit
import TinyConstraints

public class CategoryCell: UICollectionViewCell, ReusableView {
    
    lazy var imgImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()

    }
}

// MARK: - UILayout
extension CategoryCell {
    
    private func addSubviews() {
        addSubview(imgImageView)
        imgImageView.edgesToSuperview()
        imgImageView.addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 16
        titleLabel.leadingToSuperview().constant = 16
        backgroundColor = .lightText
        layer.cornerRadius = 12
        layer.borderWidth = 0.4
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
