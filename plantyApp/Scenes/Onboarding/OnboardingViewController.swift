//
//  OnboardingViewController.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit
import TinyConstraints

final class OnboardingViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(OnboardingCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.allowsMultipleSelection = false
        return collectionView
    }()
    
    private var continueButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor(red: 0.16, green: 0.69, blue: 0.43, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var terms: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 11)
        label.text = "By tapping next, you are agreeing to PlantID \n terms of Use & Privacy Policy"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor(white: 0, alpha: 0.6)
        return label
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.isUserInteractionEnabled = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = viewModel.cellItems.count
        return pageControl
    }()
    
    var viewModel = OnboardingViewModel()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        subscribeViewModel()
    }
    
}

// MARK: - UILayout
extension OnboardingViewController {
    
    private func addSubViews() {
        view.addSubview(collectionView)
        collectionView.topToSuperview()
        collectionView.edgesToSuperview(excluding: [.top, .bottom])
        collectionView.height(700)
        
        view.addSubview(continueButton)
        continueButton.bottomToSuperview(usingSafeArea: true).constant = -50
        continueButton.leadingToSuperview().constant = 24
        continueButton.trailingToSuperview().constant = -24
        continueButton.height(56)
        
        view.addSubview(terms)
        terms.topToBottom(of: continueButton).constant = 5
        terms.leadingToSuperview().constant = 24
        terms.trailingToSuperview().constant = -24
        
        view.addSubview(pageControl)
        pageControl.topToBottom(of: continueButton).constant = 5
        pageControl.leadingToSuperview().constant = 24
        pageControl.trailingToSuperview().constant = -24
        
    }
}

// MARK: - Configure & Localize
extension OnboardingViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        pageControl.isHidden = true
    }
    
    private func setLocalize() {
        continueButton.setTitle("Get Started", for: .normal)
    }
    
    private func checkButtonVisibility(by currentPage: Int) {
        let value = viewModel.cellItems[currentPage].buttonTitle ?? ""
        continueButton.setTitle("\(value)", for: .normal)
        if currentPage == 0 {
            setViewHidden(view: pageControl, hidden: true)
            setViewHidden(view: terms, hidden: false)
        } else {
            setViewHidden(view: pageControl, hidden: false)
            setViewHidden(view: terms, hidden: true)
        }
    }
    
    private func setViewHidden(view: UIView, hidden: Bool) {
        DispatchQueue.main.async {
            UIView.transition(with: view, duration: 0.25, options: .transitionCrossDissolve) {
                view.isHidden = hidden
            }
        }
    }
    
    private func subscribeViewModel() {

    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.imgImageView.image = viewModel.cellItems[indexPath.row].image
        cell.titleLabel.text = viewModel.cellItems[indexPath.row].title
        cell.subtitle.text = viewModel.cellItems[indexPath.row].subtitle
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        checkButtonVisibility(by: pageControl.currentPage)
    }
}

// MARK: - ACtions
extension OnboardingViewController {
    
    @objc
    private func continueButtonTapped() {
        if pageControl.currentPage != viewModel.cellItems.count - 1 {
            let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage += 1
        }
        count += 1
        checkButtonVisibility(by: pageControl.currentPage)
        if count == 3 {
            openPaywallController()
            count = 0
        }
    }
    
    func openPaywallController() {
        let viewController = PaywallViewController()
        UserDefaults.standard.setValue(true, forKey: "Seen")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
     }
}
