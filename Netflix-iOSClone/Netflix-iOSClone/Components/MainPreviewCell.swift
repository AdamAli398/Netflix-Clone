//
//  MainPreviewCell.swift
//  Netflix-iOSClone
//
//  Created by Adam Ali on 8/17/24.
//

import SwiftUI
import SwiftfulUI

struct MainPreviewCell: View {
    var imageName: String = Constants.randomImage
    var isNetflixOriginal: Bool = true
    var isFilm: Bool = true
    var title: String = "Peaky Blinders"
    var tags: [String] = [
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
            ImageLoaderView(urlString: imageName)
            VStack(spacing: 16) {
                VStack(spacing: 4) {
                    if isNetflixOriginal {
                        HStack(spacing: 0) {
                            Image("NetflixLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 60)
                            Text(isFilm ? "FILM" : "SHOW")
                                .kerning(7.0)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.netflixLightGrey)
                                .padding(.trailing, 14)
                        }
                    }
                    
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 4) {
                        ForEach(tags, id: \.self) { tag in
                            Text(tag)
                            
                            if tag != tags.last {
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
