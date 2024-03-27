//
//  MySettingView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("더보기")
                .font(.system(size: 35, weight: .heavy))
                .padding(.bottom, 30)
                .padding(.leading, 36)
                .padding(.top, 50)
            
            Text("회원 정보")
                .font(.system(size: 18))
                .foregroundColor(Color(red: 119/255, green: 119/225, blue: 119/255))
                .padding(.leading, 36)
            
            HStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 343, height: 296)
                        .foregroundColor(.white)
                        .shadow(radius: 10, x:0, y:8)
                    
                    VStack {
                        Image("프사")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                        
                        Text("브리")
                            .font(.system(size: 35, weight: .bold))
                        
                        Text("Breaaaaaa")
                            .font(.system(size: 24))
                    }
                }
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
