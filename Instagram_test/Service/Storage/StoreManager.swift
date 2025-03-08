//
//  StoreManager.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "Story")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data store: \(error.localizedDescription)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    // MARK: - Save Context
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension PersistenceController {
    func savePhotos(photos: [Photo]) async throws -> [PhotoEntity] {
        let context = PersistenceController.shared.context
        
        return try await withCheckedThrowingContinuation { continuation in
            context.perform {
                do {
                    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = PhotoEntity.fetchRequest()
                    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                    try context.execute(deleteRequest)
                    
                    for photo in photos {
                        let newPhoto = PhotoEntity(context: context)
                        newPhoto.id = Int64(photo.id)
                        newPhoto.title = photo.title
                        newPhoto.url = photo.url
                    }
                    
                    try context.save()
                    continuation.resume(returning: try context.fetch(PhotoEntity.fetchRequest()))
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    // Fetching photo by ID
    func fetchPhotoByID(id: Int64) -> PhotoEntity? {
           let fetchRequest: NSFetchRequest<PhotoEntity> = PhotoEntity.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "id == %d", id)
           
           do {
               let photos = try context.fetch(fetchRequest)
               return photos.first
           } catch {
               print("Error fetching photo by ID: \(error)")
               return nil
           }
       }
    
    // Update Photo with like/unlike
    func update(photo: PhotoEntity, isLiked: Bool) {
        if let photo = fetchPhotoByID(id: photo.id) {
            photo.isLiked = isLiked
            if context.hasChanges {
                do {
                    try context.save()
                    print("Context saved successfully.")
                } catch {
                    print("Failed to save context: \(error.localizedDescription)")
                }
            }
        }
    }
}
