//
//  HomeView.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/14/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack (spacing: 0) {
                header
                    .padding(.horizontal, 16)
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        // TODO: add tap gesture
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        // TODO: add tap gesture
                    }
            }
            .font(.title2)
        }
    }
}

#Preview {
    HomeView()
}
