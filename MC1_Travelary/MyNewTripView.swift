//
//  MyNewTripView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/24/24.
//

import SwiftUI
import PhotosUI
import CoreLocation

struct MyNewTripView: View {
    @State var showPicker: Bool = false
    @State private var selectedImages: [UIImage] = []
    @State private var imagesSelected: Bool = false
    
    @State private var selectedImage: UIImage?
    @State private var isCameraPresented = false
    
    @State private var photoDate: Date?
    @State private var photoLocation: CLLocation?
    
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    
    @EnvironmentObject var tripModel: TripModel
    
    @State var tag:Int? = nil
    
    private var clLocationManager = CLLocationManager()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack{
                    NavigationLink(destination: MyNewInfoView(), tag: 1, selection: self.$tag ) {
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading) {
                    if selectedImages.isEmpty {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("닫기")
                                .foregroundColor(.blue)
                        }
                        Text("남기고 싶은\n사진을 선택해 주세요")
                            .font(.system(size: 35, weight: .heavy))
                            .padding(.leading, 16)
                            .padding(.top, 20)
                        Spacer().frame(height: 150)
                        HStack {
                            ZStack(alignment: .center) {
                                Button(action: {
                                    self.showPicker = true
                                }, label: {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 169, height: 222)
                                        .foregroundColor(Color(red: 101/255, green: 117/255, blue: 255/255))
                                })
                                VStack {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 100, height: 80)
                                        .foregroundColor(.white)
                                    Text("앨범")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            ZStack {
                                Button(action: {
                                    
                                    isCameraPresented = true
                                    
                                }, label: {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 169, height: 222)
                                        .foregroundColor(Color(red: 164/255, green: 173/255, blue: 255/255))
                                })
                                VStack {
                                    Image(systemName: "camera")
                                        .resizable()
                                        .frame(width: 100, height: 80)
                                        .foregroundColor(.white)
                                    Text("카메라")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        Spacer()
                        
                    } else {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("닫기")
                                .foregroundColor(.blue)
                        }.padding(.leading, 24)
                        Text("남기고 싶은\n사진을 선택해 주세요")
                            .font(.system(size: 35, weight: .heavy))
                            .padding(.leading, 40)
                            .padding(.top, 20)
                            .padding(.bottom, 15)
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                
                                ForEach(selectedImages, id: \.self) { img in
                                    Image(uiImage: img)
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .scaledToFill()
                                        .cornerRadius(30)
                                }
                                Button(action: {
                                    self.showPicker = true
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(Color(red: 210/255, green: 210/255, blue: 210/255))
                                            .frame(width: 150, height: 150)
                                        Image(systemName: "plus")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 57, height: 57)
                                    }
                                })
                            }.padding([.leading, .trailing], 20)
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                self.tag = 1
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(red: 101/255, green: 117/255, blue: 255/255))
                                        .frame(width: 343, height: 69)
                                    Text("다음")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            })
                            Spacer()
                        }
                        .padding(.top, 15)
                    }
                }
            }
            .sheet(isPresented: $showPicker) {
                PhotoPicker(selectedImages: self.$selectedImages, showPicker: self.$showPicker, imagesSelected: self.$imagesSelected)
            }
            .sheet(isPresented: $isCameraPresented) {
                CameraPicker(selectedImage: $selectedImage, isCameraPresented: $isCameraPresented)
            }
            .onChange(of: selectedImages) { newValue in
                // selectedImages가 변경될 때마다 tripModel.selectedPhotos를 업데이트합니다.
                tripModel.selectedPhotos = newValue
            }
        }
    }
}


struct MyNewTripView_Previews: PreviewProvider {
    static var previews: some View {
        MyNewTripView()
    }
}
