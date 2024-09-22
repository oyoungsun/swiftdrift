//
//  ContentView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @Query var missions: [Mission]

    var body: some View {
        NavigationStack{
            TabView {
                HobanView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("First")
                        
                    }
                
                MissonView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Second")
                    }
                
                Text("The Last Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
                    .badge(10)
            }
                        
        }
        .onAppear(){
            if missions.isEmpty {
                settingValue()
            }
        }
    }
    
    func settingValue() {
        modelContext.insert(Mission(name: "우리집", tag: 2, tittle: "정문에 있는 성냥개비를 찾아보자!", info: "경북대학교 대구캠퍼스 정문에는 성냥개비를 닮은 조형물이 있다. 이 교시탑에는 경북대의 교육이념인 ‘진리, 긍지, 봉사’라는 교시가 새겨져 있다.",  latitude: 35.8852366, longitude: 128.6029999, pass: false))
        modelContext.insert(Mission(name: "정문", tag: 1, tittle: "정문에 있는 성냥개비를 찾아보자!", info: "경북대학교 대구캠퍼스 정문에는 성냥개비를 닮은 조형물이 있다. 이 교시탑에는 경북대의 교육이념인 ‘진리, 긍지, 봉사’라는 교시가 새겨져 있다.",  latitude: 35.8853130, longitude: 128.6146336, pass: false))
        modelContext.insert(Mission(name: "북문", tag: 1, tittle: "북문에 있는 빨간색 KNU를 찾아보자!", info: "경북대학교 대구캠퍼스 북문에는 빨간색 KNU 모형이 있다. 밥약이나 동아리 모임을 북문에서 하는 경우가 많아서 국룰 약속의 장소이다. 가끔씩 북문 근처에서 학교 동아리의 공연도 한다. 시간이 된다면 구경 가보자.", latitude: 35.8924426, longitude: 128.6095881, pass: false))
        modelContext.insert(Mission(name: "서문", tag: 1, tittle: "서문과 가장 가까운 건물번호를 찾아보자", info: "2000년 초반까지만 해도 골목 구석구석 각종 술집, 밥집이 많았으나, 북문이 생기면서 서문 상권은 급격히 쇠퇴하였다. 지금은 근처에 대운동장과 중앙 동아리를 위한 동아리방이 있는 백호관 말고는 갈 곳이 없다. 그래도 서문에서 내려가서 경대교 인근의 벚꽃이 예쁘니 4월에 가보자.", latitude: 35.8884911, longitude: 128.6040234, pass: false))
        modelContext.insert(Mission(name: "솔로문", tag: 1, tittle: "솔로문에 있는 계단 갯수를 세어보자", info: "솔로문은 원룸 사유지의 벽이었으나 유동인구가 늘어나며 길이 생겨났다. 인근 충현교회에서 지혜의 상징 솔로몬에서 유래된 'SOLO 문'이라는 문패를 만들어 주었다. 하지만 '솔로들의 문'으로 바뀌어 버렸다. 간격이 좁은 탓에 한 명 한 명씩 지나가야 해서 솔로 문이라는 뜻도 있다.",latitude: 35.8867046, longitude: 128.6057820, pass: false))
        modelContext.insert(Mission(name: "북문", tag: 2, tittle: "솔로문에 있는 계단 갯수를 세어보자", info: "솔로문은 원룸 사유지의 벽이었으나 유동인구가 늘어나며 길이 생겨났다. 인근 충현교회에서 지혜의 상징 솔로몬에서 유래된 'SOLO 문'이라는 문패를 만들어 주었다. 하지만 '솔로들의 문'으로 바뀌어 버렸다. 간격이 좁은 탓에 한 명 한 명씩 지나가야 해서 솔로 문이라는 뜻도 있다.",latitude: 35.8418216, longitude: 128.6821499, pass: false))
//
//        
//        modelContext.insert(Mission(name: "공식당", tag: 2, info: "공식당에 있는 학식을 먹어보자.", latitude: 35.8867046, longitude: 128.6057820, pass: false))
//        modelContext.insert(Mission(name: "경대리아", tag: 2, info: "솔로문에 있는 계단 갯수를 세어보자", latitude: 35.8867046, longitude: 128.6057820, pass: false))
        

    }
}

#Preview {
    NavigationStack{
        ContentView()
            .modelContainer(for: [Mission.self], inMemory: true)

    }
}
