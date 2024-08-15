//
//  FilterCell.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/15/24.
//

import SwiftUI

struct FilterCell: View {
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)

                Capsule(style: .circular)
                    .fill(.netflixDarkGrey)
                    .opacity(isSelected ? 1 : 0)
            }
        )
        .foregroundColor(.netflixLightGrey)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack() {
            FilterCell()
            FilterCell(isSelected: true)
            FilterCell(isDropdown: false)
            FilterCell(isDropdown: false, isSelected: true)
        }
    }
}
