//
//  MissionInfoView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI
import MapKit


struct MissionInfoView: View {
    var body: some View {
        Rectangle()
            .frame(width: .infinity, height: 200)
        
        VStack(alignment: .leading) {

            Text("정문에 가보자")
                .font(.title)
            
            Text("경북대학교 정문에 있는 성냥깨비 사진을 찍어보자")
            
            Map()
                .frame(width: .infinity, height: 200)
            
            
            NavigationLink(destination: MissionPerformView(),
                           label:{
                    Text("미션하기")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .frame(width: 353, alignment: .center)
                        .background(Color.orange)
                        .cornerRadius(12)
                    })
            

            
            Spacer()
            
        }
        .padding(20)
    }
    
}

#Preview {
    NavigationStack{
        MissionInfoView()
    }
}
