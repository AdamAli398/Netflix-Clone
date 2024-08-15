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
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
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
                        .padding(.leading, (selectedFilter == nil && filter == filters.first) ? 16 : 0)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        FilterScrollView()
    }
}
