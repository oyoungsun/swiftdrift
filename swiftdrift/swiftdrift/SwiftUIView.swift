//
//  SwiftUIView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/21/24.
//

import SwiftUI
import MapKit

struct SwiftUIView: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(height: 200)
            Text("정문에 가보자")
                .font(.title)
            Text("경북대학교 정문에 있는 성냥깨비 사진을 찍어보자")

            Map()
                .frame(height: 200)
            
            Spacer()
        }
        .padding(20)

        .navigationBarTitle("선정", displayMode: .inline)
        .toolbar(.hidden, for: .tabBar)
        .background(.green)

    }
}

#Preview {
    NavigationStack{
        
        SwiftUIView()
    }
}
