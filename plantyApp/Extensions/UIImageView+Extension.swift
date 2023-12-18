//
//  UIImage+Extension.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Kingfisher
import UIKit

public extension UIImageView {

    typealias NetworkImageResultClosure = (Result<UIImage, Error>) -> Void
    
    func set(image urlString: String?,
             completion: NetworkImageResultClosure? = nil) {
        guard let urlString = urlString, let source = URL(string: urlString) else {
            return
        }
        self.kf.setImage(with: source) { result in
            switch result {
            case .success(let response):
                completion?(.success(response.image))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}

public extension UIImageView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
