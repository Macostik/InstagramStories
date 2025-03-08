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
    
    private var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
        
        self.photoUrl = URL(string: photo.url)
    }
}
