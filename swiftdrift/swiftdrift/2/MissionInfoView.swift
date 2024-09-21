//
//  MissionInfoView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI
import MapKit


struct MissionInfoView: View {
    
    @Binding var selectedMission: Mission?
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0), // 초기값
        span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
    )
    
    //    @State private var selectedResult:MKMapItem
    @State private var position: MapCameraPosition = .automatic
    
    
    
    
    @StateObject private var locationManager = LocationManager()
    
    
    var body: some View {
        if let mission = selectedMission {
            VStack(alignment: .leading, spacing: 15) {
                
                Rectangle()
                    .frame(height: 200)
                
                Text(mission.tittle)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(mission.info)
                
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                    Map(position: $position) {
                        
                        Annotation("Parking", coordinate: CLLocationCoordinate2D(latitude: mission.latitude, longitude: mission.longitude)) {
                            RoundedRectangle(cornerRadius: 5)
                        }
                        .annotationTitles(.hidden)
                        
                        UserAnnotation()
                    }
                    .mapControls{
                        MapUserLocationButton()
                        
                    }
                    
                    Button(action: {
                        region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: mission.latitude, longitude: mission.longitude), // 초기값
                            span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
                        )
                        position = .region(region)
                        
                    }) {
                        Text("미션 위치보기")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(7)
                    
                }
                
                .onAppear {
                    region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: mission.latitude, longitude: mission.longitude), // 초기값
                        span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
                    )
                    position = .region(region)

                    
                    locationManager.requestLocationAuthorization()
                }
                
                NavigationLink(destination: NewCameraView(),
                               label: {
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
            .navigationBarTitle(mission.name, displayMode: .inline)
            .toolbar(.hidden, for: .tabBar)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}


#Preview {
    NavigationStack{
        MissionInfoView(selectedMission: .constant(Mission(name: "정문", tag: 1, tittle: "정문에 있는 성냥개비를 찾아보자!", info: "경북대학교 대구캠퍼스 정문에는 성냥개비를 닮은 조형물이 있다. 이 교시탑에는 경북대의 교육이념인 ‘진리, 긍지, 봉사’라는 교시가 새겨져 있다.",  latitude: 35.8853130, longitude: 128.6146336, pass: false))
        )
    }
}
