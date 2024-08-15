//
//  FilterScrollView.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/15/24.
//

import SwiftUI

struct FilterScrollView: View {
    @State var selectedFilter: FilterModel? = nil
    
    // TODO: Dynamically load array from backend
    var filters: [FilterModel] = FilterModel.sampleArray
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1.0)
                        )
                        .foregroundStyle(.netflixLightGrey)
                        .onTapGesture {
                            // TODO: Add tap logic for X button
                            selectedFilter = nil
                        }
                }
                
                ForEach(filters, id: \.self) { filter in
                    FilterCell(title: filter.title,
                               isDropdown: filter.isDropdown,
                               isSelected: selectedFilter == filter
                    )
                    .onTapGesture {
                        if selectedFilter != filter {
                            selectedFilter = filter
                        } else {
                            selectedFilter = nil
                        }
                    }
                }
            }
            .padding(4)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        FilterScrollView()
    }
}
