//
//  FlowLayout.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/26/24.
//

import SwiftUI

struct TagWrapView: View {
    let tags: [String]
    let horizontalPadding: CGFloat = 20 // 태그 사이의 가로 패딩
    let verticalPadding: CGFloat = 10 // 태그 사이의 세로 패딩
    @State private var widths: [CGFloat] = [] // 각 태그의 너비 저장
    
    var body: some View {
        VStack(alignment: .leading, spacing: verticalPadding) {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            
            addButton()
                .padding([.horizontal], horizontalPadding / 2)
                .alignmentGuide(.leading) { d in
                    if(abs(width - d.width) > geometry.size.width) {
                        width = 0
                        height -= d.height
                    }
                    let result = width
                    width = 0 // 마지막 아이템
                    return result
                }
                .alignmentGuide(.top) { _ in
                    let result = height
                    height = 0 // 마지막 아이템
                    return result
                }
            
            ForEach(0..<self.tags.count, id: \.self) { index in
                item(for: self.tags[index])
                    .padding([.horizontal], horizontalPadding / 2)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if index < tags.count - 1 {
                            width -= d.width + horizontalPadding
                        } else {
                            width = 0 // 마지막 아이템
                        }
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = height
                        if index == tags.count - 1 {
                            height = 0 // 마지막 아이템
                        }
                        return result
                    }
            }
        }
    }
    
    private func item(for text: String) -> some View {
        Text(text)
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(RoundedRectangle(cornerRadius: 150).foregroundColor(Color(red: 101/255, green: 117/255, blue: 255/255)))
            .padding(5)
    }
}

private func addButton() -> some View {
    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        Text("+추가")
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(RoundedRectangle(cornerRadius: 150)).foregroundColor(Color(red: 210/255, green: 210/255, blue: 210/255))
            .padding(5)
    })
}

struct TagWrapView_Previews: PreviewProvider {
    static var previews: some View {
        TagWrapView(tags: ["#일본", "#오사카", "#가족여행", "#맛집탐방", "#역사여행", "#긴 태그 예시입니다", "#또 다른 태그"])
    }
}
