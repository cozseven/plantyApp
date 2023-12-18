//
//  HomeViewController.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit
import TinyConstraints

final class HomeViewController: UIViewController {
    
    var headBarView = UIView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        label.text = "Hi, plant lover!"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 24)
        label.text = "Good Afternoon! ⛅"
        return label
    }()    
    var searchBar = UISearchBar()
    var freePremiumMessageView = FreePremiumMessageView()
    
    private lazy var getStarterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Regular", size: 15)
        label.text = "Get Started"
        return label
    }()
    
    var viewModel = HomeViewModel(dataProvider: ApiDataProvider())
    
    private lazy var horizontalCollectionView: UICollectionView = {
         let collectionViewLayout = UICollectionViewFlowLayout()
         collectionViewLayout.scrollDirection = .horizontal
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
         collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
         collectionView.register(QuestionsCell.self)
         return collectionView
     }()
    
    private lazy var verticalCollectionView: UICollectionView = {
         let collectionViewLayout = UICollectionViewFlowLayout()
         collectionViewLayout.scrollDirection = .vertical
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
         collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
         collectionView.register(CategoryCell.self)
         return collectionView
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        viewModel.getData()
    }
    
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        view.addSubview(headBarView)
        headBarView.topToSuperview()
        headBarView.trailingToSuperview()
        headBarView.leadingToSuperview()
        headBarView.height(175)
        headBarView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        headBarView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 24
        titleLabel.topToSuperview().constant = 50
        titleLabel.height(20)
        headBarView.addSubview(subtitleLabel)
        subtitleLabel.leadingToSuperview().constant = 24
        subtitleLabel.topToBottom(of: titleLabel).constant = 5
        subtitleLabel.height(20)
        searchBar.placeholder  = "Search for plants"
        headBarView.addSubview(searchBar)
        searchBar.topToBottom(of: subtitleLabel).constant = 12
        searchBar.leadingToSuperview().constant = 24
        searchBar.trailingToSuperview().constant = -24
        
        view.addSubview(freePremiumMessageView)
        freePremiumMessageView.topToBottom(of: headBarView).constant = 24
        freePremiumMessageView.leadingToSuperview().constant = 24
        freePremiumMessageView.trailingToSuperview().constant = -24
        freePremiumMessageView.height(64)
        
        view.addSubview(getStarterLabel)
        getStarterLabel.topToBottom(of: freePremiumMessageView).constant = 24
        getStarterLabel.leadingToSuperview().constant = 24
        getStarterLabel.trailingToSuperview().constant = -24
        
        view.addSubview(horizontalCollectionView)
        horizontalCollectionView.topToBottom(of: getStarterLabel).constant = 12
        horizontalCollectionView.leadingToSuperview().constant = 24
        horizontalCollectionView.trailingToSuperview().constant = -24
        horizontalCollectionView.height(164)
        horizontalCollectionView.backgroundColor = .clear
        
        view.addSubview(verticalCollectionView)
        verticalCollectionView.topToBottom(of: horizontalCollectionView).constant = 24
        verticalCollectionView.leadingToSuperview().constant = 24
        verticalCollectionView.trailingToSuperview().constant = -24
        verticalCollectionView.height(300)
    }
}

// MARK: - Configure & Localize
extension HomeViewController {
    
    private func configureContents() {
        searchBar.backgroundImage = UIImage()
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
    }
    
    private func setLocalize() {

    }
    
    private func subscribeViewModel() {
        viewModel.getDataDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.horizontalCollectionView.reloadData()
            self.verticalCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizontalCollectionView {
            return viewModel.questions.count
        } else if collectionView == verticalCollectionView {
            return viewModel.categories.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizontalCollectionView {
            let cell: QuestionsCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.backgroundImageView.set(image: viewModel.questions[indexPath.row].image_uri)
            cell.titleLabel.text = viewModel.questions[indexPath.row].title
            return cell
        } else if collectionView == verticalCollectionView {
            let cell: CategoryCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.imgImageView.set(image: viewModel.categories[indexPath.row].image.url)
            cell.titleLabel.text = viewModel.categories[indexPath.row].title
            return cell
        }
        return UICollectionViewCell()
    }
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == horizontalCollectionView {
            return .init(width: 240, height: 164)
        } else if collectionView == verticalCollectionView {
            return .init(width: collectionView.frame.width / 2 - 10, height: 152)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == horizontalCollectionView {
            return 16
        } else if collectionView == verticalCollectionView {
            return 16
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == horizontalCollectionView {
            return .zero

        } else if collectionView == verticalCollectionView {
            return 0
        }
        return 0
    }
}

