//
//  ProductModel.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/18/24.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: Category
    let rating: Double
    let tags: [String]
    let reviews: [Review]
    let minimumOrderQuantity: Int
    let releaseYear: Int
    let images: [String]
    let thumbnail: String
}

enum Category: String, Codable {
    case thriller = "Thriller"
    case comedy = "Comedy"
    case romance = "Romance"
    case horror = "Horror"
}

struct Review: Codable {
    let rating: Int
    let comment: String
//    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}
