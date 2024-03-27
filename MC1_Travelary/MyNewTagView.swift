//
//  MyNewTagView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/26/24.
//

import SwiftUI

struct MyNewTagView: View {
    
    @EnvironmentObject var tripModel: TripModel
    
    @State private var tags: [String] = ["#일본", "#오사카", "#가족여행", "#맛집탐방", "#역사", "#스타벅스"]
    @State private var tagWidths: [Int: CGFloat] = [:]
    @State var tag:Int? = nil
    
    var body: some View {
        
        ZStack{
            NavigationLink(destination: NewTripView(), tag: 1, selection: self.$tag ) {
                
                EmptyView()
                
            }
        }
        
        VStack(alignment: .leading) {
            Text("여행 정보를 바탕으로\n태그를 만들었어요!")
                .font(.system(size: 35, weight: .heavy))
                .padding(.leading, 36)
                .padding(.bottom, 1)
                .padding(.top, 10)
            
            Text("선택한 사진과 관련한 태그들이에요.")
                .font(.system(size: 22))
                .padding(.leading, 36)
                .padding(.bottom, 40)
                
            ScrollView {
                TagWrapView(tags: tags)
                    .padding(.horizontal, 36)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                                 
                    tripModel.tags = self.tags
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
        }
    }
}


struct MyNewTagView_Previews: PreviewProvider {
    static var previews: some View {
        MyNewTagView()
    }
}
