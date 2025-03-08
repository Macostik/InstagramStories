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
    
    @Published var photoList = [Photo]()
    @Published var isLoading = false
    @Published var path = NavigationPath()
    
    init() {
        fetchPhotos()
    }
    
    func onClickPhoto(photo: Photo) {
        path.append(photo)
    }
    
    func onLikedPhoto(photo: Photo) {
        print(">>>> like cell \(photo.id)")
    }
    
    func fetchPhotos(offset: Int = 0) {
        isLoading = true
        Task {
            do {
                let album = try await APIManager.shared.fetchPhotos(offset: offset, limit: Constant.photoLimit)
                await MainActor.run {
                    self.photoList = album.photos
                }
//                try await PersistenceController.shared.update(users: accountList, isBlockedByRegularUser: true)
            } catch {
                print("Fetched blocked user list failed with error: \(error)")
            }
            await MainActor.run { isLoading = false }
        }
    }
}
