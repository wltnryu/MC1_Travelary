//
//  MyFriendView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

struct FriendView: View {
    @State var isFriendClicked: Bool = false
    @State var isFamilyClicked: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(red: 101/255, green: 117/255, blue: 255/255)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("친구 목록")
                    .font(.system(size: 35, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.leading, 36)
                
                HStack {
                    
                    Spacer()
                        .frame(width: 25)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: .infinity, height: 42)
                            .foregroundColor(.white)
                        //.padding([.leading, .trailing], 23)
                        
                        HStack{
                            Button(action: {
                                if !isFamilyClicked && isFriendClicked {
                                    isFamilyClicked = true
                                    isFriendClicked = false
                                }
                            },
                                   label: {
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 170, height: 42)
                                        .foregroundColor(isFamilyClicked ? Color(red: 164/255, green: 173/255, blue: 255/255) : .white)
                                    
                                    Text("가족")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(isFamilyClicked ? .white : .black)
                                }
                            })
                            Button(action: {
                                if !isFriendClicked && isFamilyClicked {
                                    isFriendClicked = true
                                    isFamilyClicked = false
                                }
                            },
                                   label: {
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 170, height: 42)
                                        .foregroundColor(isFriendClicked ? Color(red: 164/255, green: 173/255, blue: 255/255) : .white)
                                    Text("지인")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(isFriendClicked ? .white : .black)
                                }
                            })
                        }
                    }
                    //.padding(.leading, 23)
                    .padding(.bottom, 10)
                    
                    Spacer()
                        .frame(width: 25)
                }
                
                
                if isFamilyClicked {
                    FamilyList()
                } else if isFriendClicked {
                    FriendList()
                }
            }
        }
    }
}

struct FamilyList: View {
    
    @State private var isShowingFriendsTripListView = false
    @State var friendTripLists: [String: [F_TripInfo]] = [:]
    @State var selectedFriend: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 30,
                topTrailing: 30))
            .foregroundColor(.white)
            .frame(height: 516)
            
            VStack{
                Button(action: {
                    
                    self.selectedFriend = "뽀야미"
                    self.friendTripLists["뽀야미"] = [
                        F_TripInfo(title: "친구 섬 여행", subtitle: "2023년 8월 아리갓도", heartNum: "102", tag: ["#아리갓도", "#모여봐요", "#동물의_숲"], imageArray: ["귀오미1", "귀오미2"]),
                        F_TripInfo(title: "열대 마을", subtitle: "2022년 7월 가슴아파도", heartNum: "207", tag: ["#가슴아파도", "나이렇게", "#웃어요"], imageArray: ["아잠만1", "아잠만2"])]
                    self.isShowingFriendsTripListView = true
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                            .frame(width: 343, height: 104)
                            .shadow(radius: 10, x:0, y:8)
                        
                        HStack {
                            Image("Profile1")
                                .resizable()
                                .clipShape(.circle)
                                .frame(width: 73, height: 73)
                                .padding(.leading, 20)
                            
                            Text("뽀야미")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading, 10)
                                .foregroundColor(.black)
                            Spacer()
                            
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.black)
                                .padding(.trailing, 25)
                            
                        }
                        
                    }.padding(.top, 25)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                }).fullScreenCover(isPresented: Binding<Bool>(
                    get: { self.isShowingFriendsTripListView && self.selectedFriend == "뽀야미" },
                    set: { _ in }
                )) {
                    if let tripList = self.friendTripLists[selectedFriend] {
                        FriendTripListView(friendName: $selectedFriend, tripList: tripList, isPresented: $isShowingFriendsTripListView)
                    } else {
                        EmptyView()
                    }
                }
                
                Button(action: {
                    
                    self.selectedFriend = "아잠만"
                    self.friendTripLists["아잠만"] = [
                        F_TripInfo(title: "친구 섬 여행", subtitle: "2023년 8월 아리갓도", heartNum: "102", tag: ["#아리갓도", "#모여봐요", "#동물의_숲"], imageArray: ["귀오미1", "귀오미2"]),
                        F_TripInfo(title: "열대 마을", subtitle: "2022년 7월 가슴아파도", heartNum: "207", tag: ["#가슴아파도", "나이렇게", "#웃어요"], imageArray: ["아잠만1", "아잠만2"])]
                    self.isShowingFriendsTripListView = true
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                            .frame(width: 343, height: 104)
                            .shadow(radius: 10, x:0, y:8)
                        
                        HStack {
                            Image("Profile2")
                                .resizable()
                                .clipShape(.circle)
                                .frame(width: 73, height: 73)
                                .padding(.leading, 20)
                            
                            Text("아잠만")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading, 10)
                                .foregroundColor(.black)
                            Spacer()
                            
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.black)
                                .padding(.trailing, 25)
                            
                        }
                        
                    }.padding(.top, 10)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                }).fullScreenCover(isPresented: Binding<Bool>(
                    get: { self.isShowingFriendsTripListView && self.selectedFriend == "아잠만" },
                    set: { _ in }
                )) {
                    if let tripList = self.friendTripLists[selectedFriend] {
                        FriendTripListView(friendName: $selectedFriend, tripList: tripList, isPresented: $isShowingFriendsTripListView)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct FriendList: View {
    
    @State private var isShowingFriendsTripListView = false
    @State var friendTripLists: [String: [F_TripInfo]] = [:]
    @State var selectedFriend: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 30,
                topTrailing: 30))
            .foregroundColor(.white)
            .frame(height: 516)
            
            VStack{
                Button(action: {
                    // 선택된 친구를 "귀오미"로 설정
                    self.selectedFriend = "귀오미"
                    // 귀오미의 여행 목록을 설정
                    self.friendTripLists["귀오미"] = [
                        F_TripInfo(title: "친구 섬 여행", subtitle: "2023년 8월 아리갓도", heartNum: "102", tag: ["#아리갓도", "#모여봐요", "#동물의_숲"], imageArray: ["귀오미1", "귀오미2"]),
                        F_TripInfo(title: "열대 마을", subtitle: "2022년 7월 가슴아파도", heartNum: "207", tag: ["#가슴아파도", "나이렇게", "#웃어요"], imageArray: ["아잠만1", "아잠만2"])]
                    // 여기서 true로 설정되어야 함
                    self.isShowingFriendsTripListView = true
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                            .frame(width: 343, height: 104)
                            .shadow(radius: 10, x:0, y:8)
                        
                        HStack {
                            Image("Profile3")
                                .resizable()
                                .clipShape(.circle)
                                .frame(width: 73, height: 73)
                                .padding(.leading, 20)
                            
                            Text("귀오미")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Spacer()
                            
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.black)
                                .padding(.trailing, 25)
                        }
                    }.padding(.top, 25)
                        .frame(width: 100)
                }).fullScreenCover(isPresented: Binding<Bool>(
                    get: { self.isShowingFriendsTripListView && self.selectedFriend == "귀오미" },
                    set: { _ in }
                )) {
                    if let tripList = self.friendTripLists[selectedFriend] {
                        FriendTripListView(friendName: $selectedFriend, tripList: tripList, isPresented: $isShowingFriendsTripListView)
                    } else {
                        EmptyView()
                    }
                }
                
                Button(action: {
                    
                    self.selectedFriend = "리처드"
                    self.friendTripLists["리처드"] = [
                        F_TripInfo(title: "친구 섬 여행", subtitle: "2023년 8월 아리갓도", heartNum: "102", tag: ["#아리갓도", "#모여봐요", "#동물의_숲"], imageArray: ["귀오미1", "귀오미2"]),
                        F_TripInfo(title: "열대 마을", subtitle: "2022년 7월 가슴아파도", heartNum: "207", tag: ["#가슴아파도", "나이렇게", "#웃어요"], imageArray: ["아잠만1", "아잠만2"])]
                    self.isShowingFriendsTripListView = true
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                            .frame(width: 343, height: 104)
                            .shadow(radius: 10, x:0, y:8)
                        
                        HStack {
                            Image("Profile4")
                                .resizable()
                                .clipShape(.circle)
                                .frame(width: 73, height: 73)
                                .padding(.leading, 20)
                            
                            Text("리처드")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Spacer()
                            
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.black)
                                .padding(.trailing, 25)
                            
                        }
                        
                    }.padding(.top, 10)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                }).fullScreenCover(isPresented: Binding<Bool>(
                    get: { self.isShowingFriendsTripListView && self.selectedFriend == "리처드" },
                    set: { _ in }
                )) {
                    if let tripList = self.friendTripLists[selectedFriend] {
                        FriendTripListView(friendName: $selectedFriend, tripList: tripList, isPresented: $isShowingFriendsTripListView)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
