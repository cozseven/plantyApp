//
//  QuestionsCell.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//
import UIKit
import TinyConstraints

public class QuestionsCell: UICollectionViewCell, ReusableView {
    
    let backgroundImageView: UIImageView =  {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
       return imageView
    }()
    
    let titleView = UIView()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 15)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        backgroundImageView.image = nil
    }
}

// MARK: - UILayout
extension QuestionsCell {
    
    private func addSubviews() {
        addSubview(backgroundImageView)
        backgroundImageView.edgesToSuperview()
        backgroundImageView.addSubview(titleView)
        titleView.leadingToSuperview()
        titleView.trailingToSuperview()
        titleView.bottomToSuperview()
        titleView.height(64)
        titleView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 15
        titleLabel.trailingToSuperview().constant = -10
        titleLabel.topToSuperview().constant = 15
        
    }
}

// MARK: - Configure & SetLocalize
extension QuestionsCell {
    
    private func configureContents() {
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
    }
}
