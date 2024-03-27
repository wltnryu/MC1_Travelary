//
//  MyTripListView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

struct TripInfo: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var heartNum: String
    var tag: [String]
    var imageArray: [String]
}

struct MyTripListView: View {
    @State var TripLists = [
        TripInfo(title: "포항 여행", subtitle: "2024년 3월 포항시", heartNum: "23", tag: ["#포항", "#혼자", "#아카데미"], imageArray: ["TripImage1", "TripImage2"]),
        TripInfo(title: "속초 여행", subtitle: "2022년 8월 속초시", heartNum: "15", tag: ["#속초", "#가족", "#해변"], imageArray: ["TripImage3", "TripImage4"]),
        TripInfo(title: "오사카 여행", subtitle: "2019년 8월 일본 오사카", heartNum: "30", tag: ["#오사카", "#친구", "#음식"], imageArray: ["TripImage5", "TripImage6"])
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Text("내가\n다녀온 여행")
                        .font(.system(size: 35, weight: .heavy))
                        .padding(.leading, 36)
                        .padding(.bottom, 5)
                        .padding(.top, 15)
                    Spacer()
                }
                
                Text("지난 나의 여행 기록이에요.")
                    .font(.system(size: 22))
                    .padding(.leading, 36)
                    .padding(.bottom, 30)
                
                ForEach(TripLists) { trip in
                    NavigationLink(destination: MyTripListRow(tripInfoData: trip)) {
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

struct MyTripListView_Previews: PreviewProvider {
    static var previews: some View {
        MyTripListView()
    }
}
