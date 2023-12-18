//
//  OnboardingViewModel.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit

protocol OnboardingViewDataSource { }

protocol OnboardingViewEventSource { }

protocol OnboardingViewProtocol: OnboardingViewDataSource, OnboardingViewEventSource {}

final class OnboardingViewModel: OnboardingViewProtocol {
        
    var cellItems = [OnboardingPage.welcome,OnboardingPage.takePhoto,OnboardingPage.getPlant]
}
