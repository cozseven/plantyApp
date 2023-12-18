//
//  PremiumFeature.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//
import UIKit

enum PremiumFeature {
    case unlimited
    case faster
    case detailed
    
    var image: UIImage {
        switch self {
        case .unlimited:
            UIImage(named: "unlimited") ?? UIImage()
        case .faster:
            UIImage(named: "faster") ?? UIImage()
        case .detailed:
            UIImage(named: "faster") ?? UIImage()
        }
    }
    
    var title: String {
        switch self {
        case .unlimited:
            return "Unlimited"
        case .faster:
            return "Faster"
        case .detailed:
            return "Detailed"
        }
    }
    
    var subtitle: String {
        switch self {
        case .unlimited:
            return "Plant Identify"
        case .faster:
            return "Process"
        case .detailed:
            return "Plant Care"
        }
    }
}
