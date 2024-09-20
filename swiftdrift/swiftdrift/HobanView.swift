//
//  HobanView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI

struct HobanView: View {
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) {
                        Text("템\($0)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .background(Color.yellow)
                    }
                }
            }
            Image("hobanwoo")
                .resizable()
        }
    }
}

#Preview {
    HobanView()
}
