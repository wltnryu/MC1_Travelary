//
//  CameraPicker.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/27/24.
//

import SwiftUI
import UIKit

struct CameraPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isCameraPresented: Bool

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera // 카메라를 소스 타입으로 설정
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraPicker

        init(_ parent: CameraPicker) {
            self.parent = parent
        }

        // 사용자가 사진을 찍거나 사진을 선택한 후 호출되는 메소드
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                DispatchQueue.main.async {
                    self.parent.selectedImage = image // 선택된 이미지를 저장
                }
            }

            parent.isCameraPresented = false // 카메라 뷰를 닫습니다.
        }

        // 사용자가 취소한 경우 호출되는 메소드
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isCameraPresented = false // 카메라 뷰를 닫습니다.
        }
    }
}
