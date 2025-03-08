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
    
    init(photo: Photo) {
        viewModel = InstagramStoryDetailViewModel(photo: photo)
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: viewModel.photoUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
