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
    
    init(photo: Photo, onLikePhoto: @escaping (Photo) -> Void) {
        viewModel = PhotoCellViewModel(photo: photo, onLikedPhoto: onLikePhoto)
    }
    var body: some View {
        AsyncImage(url: viewModel.photoURL)
            .ignoresSafeArea()
    }
}
