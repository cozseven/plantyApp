//
//  Categories.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation

public struct CategoryData: Decodable {
    let data: [Categories]
}

public struct Categories: Decodable {
    let title: String?
    let image: Img
}

public struct Img: Decodable {
    let url: String?
}
