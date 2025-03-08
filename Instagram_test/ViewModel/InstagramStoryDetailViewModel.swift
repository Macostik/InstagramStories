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
    }
    
    // Handle click like/unlike. Store like value to DB
    func likedPhoto() {
        isLiked.toggle()
        PersistenceController.shared.update(photo: photo, isLiked: isLiked)
    }
}
