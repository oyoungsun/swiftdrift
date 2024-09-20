//
//  MissonView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI

struct MissonView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var door: [String] = ["정문", "북문","쪽문", "나리문", "동문"]
    var food: [String] = ["공식당", "정보센터", "경대리아", "복지관"]
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 6,
                    pinnedViews: [],
                    content: {
                        Section(header:
                                    Text("각종 문에 가보자")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                        ) {
                            ForEach(door, id: \.self) {i in
                                NavigationLink(destination: MissionInfoView(),
                                               label:{
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text(i)
                                            .foregroundColor(.secondary)
                                        
                                        
                                    }
                                })
                                
                            }
                        }
                        
                        
                        Section(header:
                                    Text("학식을 먹어보자")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                                
                        ) {
                            ForEach(food, id: \.self) {i in
                                VStack {
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 100, height: 100)
                                    
                                    Text(i)
                                        .foregroundColor(.secondary)
                                    
                                    
                                }
                            }
                        }
                    })
            }
        }
    }
}




#Preview {
    NavigationStack{
        MissonView()
    }
}
