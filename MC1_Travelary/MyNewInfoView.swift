//
//  MyNewInfoView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/25/24.
//

import SwiftUI

struct MyNewInfoView: View {
    
    @EnvironmentObject var tripModel: TripModel
    @State var tag:Int? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack{
                NavigationLink(destination: MyNewTagView(), tag: 1, selection: self.$tag ) {
                    
                    EmptyView()
                    
                }
            }
            
            HStack {
                Text("여행 정보가 동일한지\n확인해 주세요")
                    .font(.system(size: 35, weight: .heavy))
                    .padding(.leading, 36)
                
                Spacer()
            }.padding(.bottom, 1)
                .padding(.top, 10)
            
            HStack {
                Text("잘못된 정보가 있다면 알려주세요.")
                    .font(.system(size: 22))
                    .padding(.leading, 36)
                
                Spacer()
            }.padding(.bottom, 50)
                        
            HStack{
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 343, height: 104)
                        .foregroundColor(Color(red: 243/255, green: 243/255, blue: 243/255))
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("여행 일자")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 145/255, green: 145/255, blue: 145/255))
                                .padding(.bottom, 3)
                            
                            Text("2019년 7월 3일 ~ 2019년 7월 5일")
                                .font(.system(size: 20))
                        }
                        .padding(.leading, 25)
                        
                        Spacer()
                    }
                }.frame(width: 343, height: 104)
                
                Spacer()
            }
            
            HStack{
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 343, height: 104)
                        .foregroundColor(Color(red: 243/255, green: 243/255, blue: 243/255))
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("여행 장소")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 145/255, green: 145/255, blue: 145/255))
                                .padding(.bottom, 3)
                            
                            Text("일본 오사카")
                                .font(.system(size: 20))
                        }
                        .padding(.leading, 25)
                        
                        Spacer()
                    }.frame(width: 343, height: 104)
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Text("잘못 작성되었다면?")
                    .font(.system(size: 18))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("수정하기")
                        .foregroundColor(Color(red: 101/255, green: 117/255, blue: 255/255))
                        .font(.system(size: 18, weight: .bold))
                })
                
                Spacer()
            }.padding(.bottom)
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                    // 실제 앱에서는 사진 정보를 바탕으로 구성
                    tripModel.location = "일본 오사카"
                    
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

struct MyNewInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyNewInfoView()
    }
}
