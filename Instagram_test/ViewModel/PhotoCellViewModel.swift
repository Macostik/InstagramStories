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
    
    var photo: PhotoEntity
    private var onClickPhoto: ((PhotoEntity) -> Void)?
    private var onLikedPhoto: ((PhotoEntity) -> Void)?
    
    init(photo: PhotoEntity,
         onClickPhoto: ((PhotoEntity) -> Void)?,
         onLikedPhoto: ((PhotoEntity) -> Void)?) {
        self.photo = photo
        self.onClickPhoto = onClickPhoto
        self.onLikedPhoto = onLikedPhoto
        
        self.photoURL = URL(string: photo.url ?? "")
    }
    // Handle click by cell to present detail
    func clickPhoto() {
        onClickPhoto?(photo)
    }
    
    // Handle click like/unlike. Store like value to DB
    func likedPhoto() {
        onLikedPhoto?(photo)
        isLiked.toggle()
        PersistenceController.shared.update(photo: photo, isLiked: isLiked)
    }
}
