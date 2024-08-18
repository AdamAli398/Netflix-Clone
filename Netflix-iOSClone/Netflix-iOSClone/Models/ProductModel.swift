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
    let id: UUID
    let title, description: String
    let category: Category
    let rating: Double
    let tags: [String]
    let reviews: [Review]
    let releaseYear: Int
    let images: [String]
    let thumbnail: String
    let isNetflixOriginal: Bool
    let isFilm: Bool
}

enum Category: String, Codable, CaseIterable {    
    case thriller = "Thriller"
    case comedy = "Comedy"
    case romance = "Romance"
    case horror = "Horror"
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: Date
    let reviewerName: String
}
