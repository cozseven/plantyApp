//
//  HomeViewModel.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit
import Kingfisher

protocol HomeViewDataSource { }

protocol HomeViewEventSource { }

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: HomeViewProtocol {
    

    var reloadData: (() -> Void)?
    
    var questions = [Questions]()
    var categories = [Categories]()
    
    private let group = DispatchGroup()
    private var isFetchedQuestions = false
    private var isFetchedCategories = false
    
    var getDataDidSuccess: (() -> Void)?

    private let dataProvider: DataProviderProtocol
    
    init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func getQuestions() {
        group.enter()
        let request = GetQuestionsRequest()
        dataProvider.getData(for: request) { [weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                questions = response
                isFetchedQuestions = true
            case .failure:
                break
            }
            self.group.leave()
        }
    }
    
    func getCategories() {
        group.enter()
        let request = GetCategoriRequest()
        dataProvider.getData(for: request) { [weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                categories = response.data
                isFetchedCategories = true
            case .failure:
                break
            }
            self.group.leave()
        }
    }
    
    func getData() {
        if !isFetchedQuestions {
            getQuestions()
        }
        if !isFetchedCategories {
            getCategories()
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            if self.isFetchedQuestions && self.isFetchedCategories {
                self.getDataDidSuccess?()
            }
        }
    }
}

