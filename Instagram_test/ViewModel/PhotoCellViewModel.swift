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
    @Published var isLiked: Bool = false
    
    private var photo: Photo
    private var onClickPhoto: ((Photo) -> Void)?
    private var onLikedPhoto: ((Photo) -> Void)?
    
    init(photo: Photo,
         onClickPhoto: ((Photo) -> Void)?,
         onLikedPhoto: ((Photo) -> Void)?) {
        self.photo = photo
        self.onClickPhoto = onClickPhoto
        self.onLikedPhoto = onLikedPhoto
        
        self.photoURL = URL(string: photo.url)
    }
    func clickPhoto() {
        onClickPhoto?(photo)
    }
    func likedPhoto() {
        onLikedPhoto?(photo)
        isLiked.toggle()
    }
}
