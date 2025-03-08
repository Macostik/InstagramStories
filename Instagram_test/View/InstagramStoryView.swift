//
//  InstagramStoryView.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//


import SwiftUI

struct InstagramStoryView: View {
    @ObservedObject var viewModel = InstagramStoryViewModel()
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            ZStack {
                imagesListView()
            }
            .navigationDestination(for: Photo.self) { photo in
                InstagramStoryDetailView(photo: photo)
            }
        }
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension InstagramStoryView {
    func imagesListView() -> some View {
        List(viewModel.photoList) { photo in
            PhotoCellView(photo: photo,
                          onClickPhoto: viewModel.onClickPhoto,
                          onLikePhoto: viewModel.onLikedPhoto)
            .onAppear {
                if photo == viewModel.photoList.last {
                    self.viewModel.fetchPhotos(offset: viewModel.photoList.count)
                }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.white)
        }
        .background(.black)
        .listRowSpacing(16)
        .listStyle(.plain)
        .scrollDismissesKeyboard(.immediately)
        .overlay {
            LoaderView(isPresented: $viewModel.isLoading)
        }
    }
}

#Preview {
    InstagramStoryView()
}

public struct LoaderView: View {
    @Binding var isPresented: Bool
    
    public var body: some View {
        ProgressView()
            .padding(10)
            .tint(.blue)
            .background(
                Circle()
                    .foregroundColor(.white)
            )
            .padding(.bottom, 20)
            .opacity(isPresented ? 1.0 : 0.0)
            .animation(.easeInOut, value: isPresented)
    }
}
