//
//  MissonView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI
import SwiftData


struct MissonView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var door: [String] = ["정문", "북문","쪽문", "나리문", "동문"]
    var food1: [String] = ["공식당", "정보센터", "경대리아", "복지관"]
    var food2: [String] = ["학식먹자"]
    
    @Query var missions: [Mission]
    
    @State var selectedMission: Mission?
    
    
    var mission1: [Mission] {
        missions.filter { $0.tag == 1 }
    }
    
    var mission2: [Mission] {
        missions.filter { $0.tag == 2 }
    }
    
    var body: some View {
        VStack{
            Text("경북대 미션도감")
                .font(.title)
                .fontWeight(.bold)
            
            
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: 6,
                    pinnedViews: [],
                    content: {
                        Section(header:
                                    Text("📍 학식먹기")
                            .foregroundStyle(Color.gray)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                        ) {
                            ForEach(mission1, id: \.name) {mission in
                                NavigationLink(destination: MissionInfoView(selectedMission: $selectedMission),
                                               label:{
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text(mission.name)
                                            .foregroundColor(.secondary)
                                    }
                                })
                                .simultaneousGesture(TapGesture().onEnded{ selectedMission = mission })

                            }
                        }
                        
                        Section(header:
                                    Text("📍 본관 정원")
                            .foregroundStyle(Color.gray)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                                
                                
                        ) {
                            ForEach(mission2, id: \.name) {mission in
                                NavigationLink(destination: MissionInfoView(selectedMission: $selectedMission),
                                               label:{
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text(mission.name)
                                            .foregroundColor(.secondary)
                                    }
                                })
                                .simultaneousGesture(TapGesture().onEnded{ selectedMission = mission })
                            }
                        }
                    })
            }
        }
        .padding(20)
    }
}




#Preview {
    NavigationStack{
        MissonView()
            .modelContainer(for: [Mission.self], inMemory: true)
    }
}
