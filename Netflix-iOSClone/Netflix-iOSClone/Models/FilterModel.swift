//
//  FilterModel.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/15/24.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static let sampleArray: [FilterModel] = [
        FilterModel(title: "TV Shows", isDropdown: false),
        FilterModel(title: "Movies", isDropdown: false),
        FilterModel(title: "Categories", isDropdown: true)
    ]
}
