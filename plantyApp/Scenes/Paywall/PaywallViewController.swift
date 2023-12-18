//
//  PaywallViewController.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit
import TinyConstraints

final class PaywallViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
       let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = UIColor(white: 0, alpha: 0.3)
        button.layer.cornerRadius = 16
        button.setTitle("X", for: .normal)
        return button
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private lazy var flowerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Plant")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var overLay: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 27)
        label.text = "PlantApp Premium"
        label.textColor = .white
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 17)
        label.text = "Access All Features"
        label.textColor = UIColor(white: 1, alpha: 0.3)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(FeatureCell.self)
         return collectionView
     }()
    
    var premiumOptionOne = PremiumOptionsView()
    var premiumOptionTwo = PremiumOptionsView()
    
    private var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Try free for 3 days", for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor(red: 0.16, green: 0.69, blue: 0.43, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 16)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var termsConditionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 9)
        label.textColor = UIColor(white: 1, alpha: 0.3)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var termsConditionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Medium", size: 11)
        label.textColor = UIColor(white: 1, alpha: 0.3)
        label.textAlignment = .center
        label.text = "Terms  Privacy  Restore"
        return label
    }()
    
    var viewModel = PaywallViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        subscribeViewModel()
    }
    
}

// MARK: - UILayout
extension PaywallViewController {
    
    private func addSubViews() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.edgesToSuperview()
        backgroundImageView.applyBlurEffect()
        view.addSubview(flowerImageView)
        flowerImageView.topToSuperview().constant = 50
        flowerImageView.edgesToSuperview(excluding: [.bottom, .top])
        flowerImageView.height(377)
        view.addSubview(overLay)
        overLay.edgesToSuperview()
        overLay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        overLay.addSubview(titleLabel)
        titleLabel.centerY(to: flowerImageView).constant = 76
        titleLabel.leadingToSuperview().constant = 24
        titleLabel.trailingToSuperview().constant = -24
        
        overLay.addSubview(subtitleLabel)
        subtitleLabel.topToBottom(of: titleLabel).constant = 3
        subtitleLabel.leadingToSuperview().constant = 24
        subtitleLabel.trailingToSuperview().constant = -24
        
        overLay.addSubview(collectionView)
        collectionView.topToBottom(of: subtitleLabel).constant = 20
        collectionView.leadingToSuperview().constant = 24
        collectionView.trailingToSuperview().constant = -24
        collectionView.height(156)
        
        overLay.addSubview(premiumOptionOne)
        premiumOptionOne.topToBottom(of: collectionView).constant = 24
        premiumOptionOne.leadingToSuperview().constant = 24
        premiumOptionOne.trailingToSuperview().constant = -24
        premiumOptionOne.height(60)
        overLay.addSubview(premiumOptionTwo)
        premiumOptionTwo.topToBottom(of: premiumOptionOne).constant = 16
        premiumOptionTwo.leadingToSuperview().constant = 24
        premiumOptionTwo.trailingToSuperview().constant = -24
        premiumOptionTwo.height(60)
        
        overLay.addSubview(continueButton)
        continueButton.topToBottom(of: premiumOptionTwo).constant = 26
        continueButton.leadingToSuperview().constant = 24
        continueButton.trailingToSuperview().constant = -24
        continueButton.height(52)
        
        overLay.addSubview(termsConditionLabel)
        termsConditionLabel.topToBottom(of: continueButton).constant = 3
        termsConditionLabel.leadingToSuperview().constant = 24
        termsConditionLabel.trailingToSuperview().constant = -24
        termsConditionLabel.height(30)
        
        overLay.addSubview(termsConditionsLabel)
        termsConditionsLabel.topToBottom(of: termsConditionLabel).constant = 3
        termsConditionsLabel.leadingToSuperview().constant = 24
        termsConditionsLabel.trailingToSuperview().constant = -24
        termsConditionsLabel.height(15)
        
        overLay.addSubview(closeButton)
        closeButton.topToSuperview(usingSafeArea: true)
        closeButton.trailingToSuperview().constant = -24
        closeButton.height(30)
    }
}

// MARK: - Configure & Localize
extension PaywallViewController {
    
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        premiumOptionOne.title = "1 Month"
        premiumOptionOne.subtitle = "$2.99/month, auto renewable"
        premiumOptionTwo.title = "1 Year"
        premiumOptionTwo.subtitle = "First 3 days free, then $529.99/year"
        termsConditionLabel.text = "After the 3-day free trial period you'll be charged $274.99 per year unless you \n cancel before the trial expires. Yearly Subscription is Auto-renewable"
    }
    
    private func subscribeViewModel() {
        premiumOptionOne.didTapped = { [ weak self ] in
            guard let self = self else { return }
            premiumOptionTwo.setPassiveOption()
        }
        premiumOptionTwo.didTapped = { [ weak self ] in
            guard let self = self else { return }
            premiumOptionOne.setPassiveOption()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension PaywallViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FeatureCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.titleLabel.text = viewModel.cellItems[indexPath.row].title
        cell.subtitleLabel.text = viewModel.cellItems[indexPath.row].subtitle
        cell.backgroundImageView.image = viewModel.cellItems[indexPath.row].image
        return cell
    }
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension PaywallViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: 156, height: 130)
    }
}

// MARK: - Actions
extension PaywallViewController {
    @objc
    func continueButtonTapped() {
        UserDefaults.standard.setValue(true, forKey: "Seen")
        let plantTabBarViewController = PlantTabBarViewController()
        plantTabBarViewController.modalPresentationStyle = .fullScreen
        present(plantTabBarViewController, animated: true, completion: nil)
    }
    
    @objc
    func closeButtonTapped() {
        UserDefaults.standard.setValue(true, forKey: "Seen")
        let plantTabBarViewController = PlantTabBarViewController()
        plantTabBarViewController.modalPresentationStyle = .fullScreen
        self.present(plantTabBarViewController, animated: true, completion: nil)
    }
}

