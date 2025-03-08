//
//  InstagramStoryDetailView.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//


import SwiftUI

struct InstagramStoryDetailView: View {
    @ObservedObject var viewModel: InstagramStoryDetailViewModel
    
    init(photo: PhotoEntity) {
        viewModel = InstagramStoryDetailViewModel(photo: photo)
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: viewModel.photoUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "photo")
            }
            .onTapGesture(count: 2) {
                viewModel.likedPhoto()
            }
            .overlay(alignment: .topTrailing) {
                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                    .frame(width: 50, height: 50)
                    .foregroundColor(viewModel.photo.isLiked ? .red : .white)
                    .foregroundColor(.white)
                    .padding(.top)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
