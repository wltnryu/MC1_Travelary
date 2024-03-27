//
//  MyTripListRow.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

struct MyTripListRow: View {
    var tripInfoData: TripInfo
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading) {
                Text(tripInfoData.title)
                    .font(.system(size: 35, weight: .heavy))
                    .padding([.leading, .top], 36)
                
                HStack {
                    Text(tripInfoData.subtitle)
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.red)
                    
                    Text(tripInfoData.heartNum)
                        .font(.system(size: 24))
                    
                }.padding([.leading, .trailing], 36)
                    .padding(.bottom, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tripInfoData.tag, id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 25, weight: .bold))
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom],7)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 150)
                                        .fill(Color(red: 101/255, green: 117/255, blue: 255/255))
                                )
                        }
                    }.padding(.leading, 36)
                        .padding(.bottom, 30)
                }
                
                ForEach(tripInfoData.imageArray, id: \.self) { imageName in
                    Image(imageName)
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
            }
        }
    }
}


struct MyTripListRow_Previews: PreviewProvider {
    static var previews: some View {
        MyTripListRow(tripInfoData: TripInfo(title: "Sample Title", subtitle: "Sample Subtitle", heartNum: "10", tag: ["#tag1", "#tag2"], imageArray: ["Image1", "Image2"]))
    }
}
