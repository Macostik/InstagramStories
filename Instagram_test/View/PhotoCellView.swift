//
//  PhotoCellView.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//


import SwiftUI

struct PhotoCellView: View {
    @ObservedObject var viewModel: PhotoCellViewModel
    
    init(photo: Photo,
         onClickPhoto: @escaping (Photo) -> Void,
         onLikePhoto: @escaping (Photo) -> Void) {
        viewModel = PhotoCellViewModel(photo: photo,
                                       onClickPhoto: onClickPhoto)
    }
    var body: some View {
        AsyncImage(url: viewModel.photoURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "photo")
        }
        .onTapGesture {
            viewModel.clickPhoto()
        }
        .onTapGesture(count: 2) {
            viewModel.likedPhoto()
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                .frame(width: 50, height: 50)
                .foregroundColor(viewModel.isLiked ? .red : .white)
                .padding(.trailing)
                .padding(.top)
        }
    }
}
