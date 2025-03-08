//
//  InstagramStoryViewModel.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation

class InstagramStoryViewModel: ObservableObject {
    
    @Published var photoList = [Photo]()
    @Published var isLoading = false
    
    func onLikedPhoto(photo: Photo) {}
    
    func fetchPhotos(offset: Int = 0) {
        
    }
    
}
