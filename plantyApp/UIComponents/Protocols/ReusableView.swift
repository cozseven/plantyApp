//
//  ReusableView.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
