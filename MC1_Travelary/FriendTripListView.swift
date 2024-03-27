//
//  FriendTripListView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/23/24.
//

import SwiftUI

struct F_TripInfo: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var heartNum: String
    var tag: [String]
    var imageArray: [String]
}

struct FriendTripListView: View {
    
    @Binding var friendName: String
    var tripList: [F_TripInfo]
    @Binding var isPresented: Bool
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    Button(action: {
                        isPresented = false // isPresented 값을 변경하여 fullScreenCover 닫기
                    }) {
                        Text("닫기")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    
                    HStack {
                        Text("\(friendName)이(가)\n다녀온 여행")
                            .font(.system(size: 35, weight: .heavy))
                            .padding(.leading, 36)
                            .padding(.bottom, 5)
                            .padding(.top, 15)
                        Spacer()
                    }
                    
                    Text("지난 \(friendName)의 여행 기록이에요.")
                        .font(.system(size: 22))
                        .padding(.leading, 36)
                        .padding(.bottom, 30)
                    
                    ForEach(tripList) { trip in // tripList로 변경
                        NavigationLink(destination: FriendTripListRow(tripInfoData: trip)) {
                            ZStack {
                                Image(trip.imageArray[0])
                                    .resizable()
                                    .frame(width: 319, height: 223)
                                    .cornerRadius(30)
                                    .opacity(0.5)
                                VStack{
                                    Text(trip.title)
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(.black)
                                    
                                    Text(trip.subtitle)
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }
                            .padding([.leading, .trailing], 35)
                            .padding(.bottom, 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct FriendTripListView_Previews: PreviewProvider {
    static var previews: some View {
        let tripList: [F_TripInfo] = [
            F_TripInfo(title: "Sample Trip 1", subtitle: "2024년 3월", heartNum: "10", tag: ["#Sample", "#Trip"], imageArray: ["귀오미1", "귀오미2"]),
            F_TripInfo(title: "Sample Trip 2", subtitle: "2024년 4월", heartNum: "15", tag: ["#Sample", "#Trip"], imageArray: ["아잠만1", "아잠만2"])
        ]
        
        return FriendTripListView(friendName: .constant("귀오미"), tripList: tripList, isPresented: .constant(true))
    }
}
