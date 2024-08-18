//
//  MainPreviewCell.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/17/24.
//

import SwiftUI
import SwiftfulUI

struct MainPreviewCell: View {
    var imageName: String = ""//Constants.randomImage
    var isNetflixOriginal: Bool = true
    var title: String = "Peaky Blinders"
    var categories: [String] = [
        "Comedy",
        "Thriller",
        "Gritty",
        "Romance"
    ]
    
    var onPressBackground: (() -> Void)? = nil
    var onPressPlay: (() -> Void)? = nil
    var onPressMyList: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: "https://occ-0-8407-999.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABQr3KP5nDaBi4Q6q1XI2Q9BoptbUfDx4tKls68OKTkFS51hwHO84QdeIXn5jypLB6yoxeVsxz-QRrXEt8khITCfYdYwZgu2p_L4r.jpg?r=07e")
            VStack(spacing: 16) {
                VStack(spacing: 4) {
                    if isNetflixOriginal {
                        HStack(spacing: 0) {
                            Image("NetflixLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 60)
                            Text("FILM")
                                .kerning(7.0)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.netflixLightGrey)
                                .padding(.trailing, 14)
                        }
                    }
                    
                    Text("Peaky Blinders")
                        .font(.system(size: 50, weight: .medium, design: .serif))
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 4) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                            
                            if category != categories.last {
                                Circle()
                                    .frame(width: 3, height: 3)
                            }
                        }
                    }
                    .fontWeight(.semibold)
                    
                    HStack(spacing: 16) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Play")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(.netflixDarkGrey)
                        .background(.netflixWhite)
                        .cornerRadius(8)
                        .asButton(.press) {
                            onPressPlay?()
                        }
                        
                        HStack {
                            Image(systemName: "plus")
                            Text("My List")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(.netflixWhite)
                        .background(.netflixRed)
                        .cornerRadius(8)
                        .asButton(.press) {
                            onPressMyList?()
                        }
                    }
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding(8)
                }
                .padding(16)
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.5),
                            .netflixBlack.opacity(0.5)
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            }
//            Image("PeakyBlinders")
//                .resizable()
//                .scaledToFill()
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Image("NetflixLogo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: 70)
//                    Text("SHOW")
//                        .foregroundStyle(.netflixLightGrey)
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                HStack {
//                    Text(categories[1])
//                    Divider()
//                        .frame(height: 15)
//                        .foregroundStyle(.netflixLightGrey)
//                    Text(categories[2])
//                }
//                .foregroundStyle(.netflixLightGrey)
//            }
//            .frame(maxHeight: 200)
        }
        .aspectRatio(0.8, contentMode: .fit)
//        .frame(maxWidth: 300)
        .cornerRadius(15)
        .foregroundStyle(.netflixWhite)
        .asButton(.tap) {
            onPressBackground?()
        }
    }
}

#Preview {
    MainPreviewCell()
        .padding(40)
}
