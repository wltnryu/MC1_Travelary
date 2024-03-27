//
//  PhotoCollageView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/25/24.
//

import SwiftUI
import PhotosUI

struct PhotoCollageView: View {
    @State private var selectedImages: [UIImage] = []
    @State private var showPicker: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                ForEach(selectedImages, id: \.self) { img in
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
            }
        }
        .sheet(isPresented: $showPicker) {
            PhotoPicker(selectedImages: $selectedImages, showPicker: $showPicker)
        }
    }
}

