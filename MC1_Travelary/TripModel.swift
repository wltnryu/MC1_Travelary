//
//  TripModel.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/27/24.
//

import SwiftUI
import Combine

class TripModel: ObservableObject {
    @Published var selectedPhotos: [UIImage] = []
    @Published var location: String = ""
    @Published var tags: [String] = []
}
