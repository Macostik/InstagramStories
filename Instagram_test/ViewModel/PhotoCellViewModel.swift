//
//  PhotoCellViewModel.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation

final class PhotoCellViewModel: ObservableObject {
    
    @Published var photoURL: URL?
    
    private var photo: Photo
    private var onLikedPhoto: ((Photo) -> Void)?
    
    init(photo: Photo, onLikedPhoto: ((Photo) -> Void)?) {
        self.photo = photo
        self.onLikedPhoto = onLikedPhoto
        
        self.photoURL = URL(string: photo.url)
    }
    
    func likedPhoto() {
        onLikedPhoto?(photo)
    }
}
