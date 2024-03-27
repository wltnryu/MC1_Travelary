//
//  MyTripView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

struct TripView: View {
    
    @State var tag:Int? = nil
    @State var isShowingNewTripView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("추억하고 싶은 \n여행이 있나요? ✈️")
                    .padding(.leading, 36)
                    .padding(.bottom, 10)
                    .font(.system(size: 35, weight: .heavy))
                Spacer()
            }
            
            Text("지난 여행을 보거나 \n새로운 여행을 남길 수 있어요")
                .padding(.leading, 36)
                .font(.system(size: 22))
                .padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    ZStack{
                        NavigationLink(destination: MyTripListView(), tag: 1, selection: self.$tag ) {
                            EmptyView()
                        }
                    }
                    
                    Button(action: {
                        self.tag = 1
                    }, label: {
                        ZStack(alignment: .bottomLeading) {
                            Image("M_TripImage")
                                .resizable()
                                .frame(width:295, height: 406)
                                .cornerRadius(30)
                                .opacity(0.5)
                            
                            VStack(alignment: .leading) {
                                Text("나의")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                
                                HStack {
                                    Text("여행 기록")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight: .heavy))
                                        .padding(.trailing, 10)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32))
                                        .bold()
                                }
                            }.padding([.leading, .bottom], 30)
                        }                    }).padding(.leading, 36)
                        .padding(.trailing, 20)
                    
                    Button(action: {
                        
                        self.isShowingNewTripView = true
                        
                    }, label: {
                        ZStack(alignment: .bottomLeading) {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color(red: 101/255, green: 117/255, blue: 255/255))
                                .frame(width: 295, height: 406)
                            
                            VStack(alignment: .leading) {
                                Text("새 여행")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                HStack {
                                    Text("시작하기")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight: .heavy))
                                        .padding(.trailing, 10)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32))
                                        .bold()
                                }
                            }.padding([.leading, .bottom], 30)
                        }
                    }).padding(.trailing, 35)
                        .fullScreenCover(isPresented: $isShowingNewTripView, onDismiss: {
                            self.isShowingNewTripView = false
                        }) {
                            MyNewTripView()
                        }
                }
            }.frame(height: 406)
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
