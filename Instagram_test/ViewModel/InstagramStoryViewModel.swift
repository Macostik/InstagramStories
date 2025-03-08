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
    
    init() {
        fetchPhotos()
    }
    
    func onLikedPhoto(photo: Photo) {}
    
    func fetchPhotos(offset: Int = 0) {
        isLoading = true
        Task {
            do {
                let album = try await APIManager.shared.fetchPhotos(offset: offset, limit: Constant.photoLimit)
                photoList = album.photos
//                try await PersistenceController.shared.update(users: accountList, isBlockedByRegularUser: true)
            } catch {
                print("Fetched blocked user list failed with error: \(error)")
            }
            await MainActor.run { isLoading = false }
        }
    }
}
