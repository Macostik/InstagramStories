//
//  InstagramStoryDetailViewModel.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//


import Foundation

class InstagramStoryDetailViewModel: ObservableObject {
    
    @Published var photoUrl: URL?
    @Published var isLiked: Bool = false
    
    
    var photo: PhotoEntity
    
    init(photo: PhotoEntity) {
        self.photo = photo
        
        self.photoUrl = URL(string: photo.url ?? "")
//        self.isLiked = photo.isLiked
    }
    
    func likedPhoto() {
//        photo.isLiked = !photo.isLiked
//        isLiked = photo.isLiked
        isLiked.toggle()
        PersistenceController.shared.update(photo: photo, isLiked: isLiked)
    }
}
