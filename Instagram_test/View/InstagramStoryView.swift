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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

extension InstagramStoryView {
    func imagesListView() -> some View {
        List(viewModel.photoList) { photo in
            PhotoCellView(photo: photo, onLikePhoto: viewModel.onLikedPhoto)
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
        .padding(.horizontal)
        .overlay {
            LoaderView(isPresented:$viewModel.isLoading)
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
