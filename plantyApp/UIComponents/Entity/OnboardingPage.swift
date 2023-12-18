//
//  OnboardingPage.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit

enum OnboardingPage {
    case welcome
    case takePhoto
    case getPlant
    
    var title: String? {
        switch self {
        case .welcome:
            return "Welcome To PlantApp"
        case .takePhoto:
            return "Take a photo to identify\n the plant!"
        case .getPlant:
            return "Get plant care guides"
        }
    }
    
    var buttonTitle: String? {
        switch self {
        case .welcome:
            return "Get Started"
        case .takePhoto:
            return "Continue"
        case .getPlant:
            return "Continue"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .welcome:
            return "Identify more than 3000+ plants and \n 88% accuracy."
        case .takePhoto:
            return ""
        case .getPlant:
            return ""
        }
    }
    
    var image: UIImage? {
        switch self {
        case .welcome:
            UIImage(named: "image1") ?? UIImage()
        case .takePhoto:
            UIImage(named: "image2") ?? UIImage()
        case .getPlant:
            UIImage(named: "image3") ?? UIImage()
        }
    }
}
