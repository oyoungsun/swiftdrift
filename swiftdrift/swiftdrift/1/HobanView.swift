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
            Text("크누키")
                .fontWeight(.bold)
                .font(.system(size: 30))
            
            
            
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(0..<10) {
//                        Text("템\($0)")
//                            .foregroundColor(.black)
//                            .font(.largeTitle)
//                            .background(Color.yellow)
//                    }
//                }
//            }
                        
            
            Image("hobanwoo")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            
            NavigationLink(destination: DecorateView(),
                           label:{
                Text("꾸미기 >")
                
                    .font(.system(size: 20))
                    .fontWeight(.bold)
//                    .frame(width: 120, height: 40)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color.yellow)

                    .cornerRadius(40)
            })
            
            

        }
        .padding()
    }
}

#Preview {
    NavigationStack{
        HobanView()
    }
}
