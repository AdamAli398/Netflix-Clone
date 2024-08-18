//
//  HomeView.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/14/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State private var selectedFilter: FilterModel? = nil
    @State private var mainPreviewProduct: Product? = nil
    @State private var filters: [FilterModel] = FilterModel.sampleArray
    
    @State private var currentUser: User? = nil
//    @State private var productRows: ProductRows? = nil
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            VStack {
                VStack (spacing: 0) {
                    header
                        .padding(.horizontal, 16)
                        .background(.netflixBlack)
                    FilterScrollView(
                        selectedFilter: selectedFilter,
                        filters: filters,
                        onPressXMark: {
                            selectedFilter = nil
                        },
                        onSelectFilter: { filter in
                            if selectedFilter != filter {
                                selectedFilter = filter
                            } else {
                                selectedFilter = nil
                            }
                        }
                    )
                    .padding(.top, 16)
                }
                .background(.netflixBlack)

                ScrollView(.vertical) {
                    VStack(spacing: 8) {
                        if let mainPreviewProduct = mainPreviewProduct {
                            MainPreviewCell(
                                imageName: mainPreviewProduct.thumbnail,
                                isNetflixOriginal: mainPreviewProduct.isNetflixOriginal,
                                isFilm: mainPreviewProduct.isFilm,
                                title: mainPreviewProduct.title,
                                tags: mainPreviewProduct.tags,
                                onPressBackground: {
                                    print("Clicked background")
                                },
                                onPressPlay: {
                                    print("Clicked Play button")
                                },
                                onPressMyList: {
                                    print("Clicked My List button")
                                })
                                .padding(.horizontal, 32)
                                .padding(.vertical, 16)
                        }
                        
                        ForEach(Category.allCases, id: \.rawValue) { category in
                            HStack {
                                Text(category.rawValue)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            .padding(.leading, 16)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 16) {
                                    ForEach(1..<10) { cell in
                                        WebImage(url: URL(string: Constants.sampleImage))
                                            .frame(width: 140, height: 200)
                                            .clipped()
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                            .padding(.top, -4)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
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
    
    private func getData() async {
        // TODO: Load in products (shows/movies) automatically
        mainPreviewProduct = Product(
            id: UUID(),
            title: "Peaky Blinders",
            description: "A notorious gang in 1919 Birmingham, England, is led by the fierce Tommy Shelby, a crime boss set on moving up in the world no matter the cost.",
            category: .thriller,
            rating: 5.0,
            tags: ["Thriller", "Gritty", "Romance"],
            reviews: [Review(
                rating: 5,
                comment: "This is the best show on Netflix!",
                date: Date(),
                reviewerName: "Adam")
            ],
            releaseYear: 2013,
            images: ["https://occ-0-8407-999.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABQr3KP5nDaBi4Q6q1XI2Q9BoptbUfDx4tKls68OKTkFS51hwHO84QdeIXn5jypLB6yoxeVsxz-QRrXEt8khITCfYdYwZgu2p_L4r.jpg?r=07e"],
            thumbnail: "https://occ-0-8407-999.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABQr3KP5nDaBi4Q6q1XI2Q9BoptbUfDx4tKls68OKTkFS51hwHO84QdeIXn5jypLB6yoxeVsxz-QRrXEt8khITCfYdYwZgu2p_L4r.jpg?r=07e",
            isNetflixOriginal: true,
            isFilm: false)
    }
}

#Preview {
    HomeView()
}
