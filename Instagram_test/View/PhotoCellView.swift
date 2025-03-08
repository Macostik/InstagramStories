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
    
    init(photo: PhotoEntity,
         onClickPhoto: @escaping (PhotoEntity) -> Void,
         onLikePhoto: @escaping (PhotoEntity) -> Void) {
        viewModel = PhotoCellViewModel(photo: photo,
                                       onClickPhoto: onClickPhoto,
                                       onLikedPhoto: onLikePhoto)
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
            Image(systemName: viewModel.photo.isLiked ? "heart.fill" : "heart")
                .frame(width: 50, height: 50)
                .foregroundColor(viewModel.photo.isLiked ? .red : .white)
                .padding(.trailing)
                .padding(.top)
        }
    }
}
