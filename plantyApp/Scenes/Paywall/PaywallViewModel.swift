//
//  PaywallViewModel.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit

protocol PaywallViewDataSource { }

protocol PaywallViewEventSource { }

protocol PaywallViewProtocol: PaywallViewDataSource, PaywallViewEventSource {}

final class PaywallViewModel: PaywallViewProtocol {
        
    var cellItems = [PremiumFeature.unlimited,PremiumFeature.faster,PremiumFeature.detailed]
}
