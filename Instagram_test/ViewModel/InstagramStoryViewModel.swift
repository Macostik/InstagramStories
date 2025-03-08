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
import SwiftUI

class InstagramStoryViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var path = NavigationPath()
    
    init() {
        fetchPhotos()
    }
    
    func onClickPhoto(photo: PhotoEntity) {
        path.append(photo)
    }
    
    func onLikedPhoto(photo: PhotoEntity) {
        
    }
    
    func fetchPhotos(offset: Int = 0) {
        isLoading = true
        Task {
            do {
                // Fetch list photos from the free Network API
                let album = try await APIManager.shared.fetchPhotos(offset: offset, limit: Constant.photoLimit)
                _ = try await PersistenceController.shared.savePhotos(photos: album.photos)
            } catch {
                print("Fetched blocked user list failed with error: \(error)")
            }
            await MainActor.run { isLoading = false }
        }
    }
}
