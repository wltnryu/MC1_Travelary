//
//  NewTripView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/27/24.
//

import SwiftUI

struct NewTripView: View {
    
    @EnvironmentObject var tripModel: TripModel
    @State var isShownFullScreenCover = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(tripModel.location) 여행")
                        .font(.system(size: 35, weight: .heavy))
                        .padding([.leading, .top], 36)
                    
                    HStack {
                        Text(tripModel.location)
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.red)
                        
                        Text("0")
                            .font(.system(size: 24))
                        
                    }.padding([.leading, .trailing], 36)
                        .padding(.bottom, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(tripModel.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.system(size: 25, weight: .bold))
                                    .padding([.leading, .trailing])
                                    .padding([.top, .bottom], 7)
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 150)
                                            .fill(Color(red: 101/255, green: 117/255, blue: 255/255))
                                    )
                            }
                        }.padding(.leading, 36)
                            .padding(.bottom, 30)
                    }
                    
                    ForEach(tripModel.selectedPhotos, id: \.self) { imageName in
                        Image(uiImage: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: .infinity)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.3), radius: 14, x: 0 , y: 8)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(Color.white, lineWidth: 25) // 테두리의 두께를 조정
                            )
                            .padding(.bottom, 50)
                    }.padding([.leading, .trailing], 36)
                    
                    Spacer() // 스크롤 뷰의 나머지 공간을 차지
                    
                }
            }
            
            Button(action: {
                self.isShownFullScreenCover.toggle()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red: 101/255, green: 117/255, blue: 255/255))
                        .frame(width: 343, height: 69)
                    Text("완료")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
            }).fullScreenCover(isPresented: $isShownFullScreenCover) {
                ContentView()
            }
            .padding(.bottom, 20) // 완료 버튼과 스택 사이의 간격 조정
            
        }
    }
}
