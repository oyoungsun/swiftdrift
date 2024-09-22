//
//  CameraView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/20/24.
//

import SwiftUI
import SwiftData

struct NewCameraView: View {
    @StateObject private var model = MosuDataModel()
    @StateObject var viewModel = NewCamera()
    private static let barHeightFactor = 0.15
    
    @State var isfounded = false
    @Environment(\.modelContext) private var modelContext
    
    @State private var selectedFactor: Int = 1
    
    
    var missionName: String
    
    @Query var missions: [Mission]

    
    var filteredMission: Mission? {
        return self.missions.filter({ $0.name == missionName }).first
    }

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ViewfinderView(image: $model.viewfinderImage)
                    .overlay(alignment: .bottom) {
                        // Unwrapping
                        if isfounded {
                            if model.resultString == missionName { //filteredCat에 걸리는 고양이가 있으면 그걸 foundCat으로 담고, foundView에서 보여줌
                                foundView(missionName: missionName)
                            }
                            else {
                                unfoundView()
                            }
                            
                            
                        }else {
                            VStack {
                                HStack(spacing: 8) {
                                    Button(action: {
                                        selectedFactor = 1
                                        self.viewModel.zoom(factor: 1)
                                    }, label: {
                                        Text("1")
                                            .scaleEffect(selectedFactor == 1 ? 1.0 : 0.7)
                                            .foregroundStyle(selectedFactor == 1 ? .yellow : .white)
                                    })
                                    .frame(width: selectedFactor == 1 ? 35 : 25, height: selectedFactor == 1 ? 35 : 25)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Circle())
                                    
                                    Button(action: {
                                        selectedFactor = 2
                                        self.viewModel.zoom(factor: 2)
                                    }, label: {
                                        Text("2")
                                            .scaleEffect(selectedFactor == 2 ? 1.0 : 0.7)
                                            .foregroundStyle(selectedFactor == 2 ? .yellow : .white)
                                    })
                                    .frame(width: selectedFactor == 2 ? 35 : 25, height: selectedFactor == 2 ? 35 : 25)
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Circle())
                                }
                                .clipShape(Capsule())
                                buttonsView()
                                    .frame(height: geometry.size.height * Self.barHeightFactor)
                                    .background(.black)
                            }
                        }
                    }
                    .background(.black)
            }
        }
        .animation(.snappy(duration: 0.3), value: selectedFactor)
        .task {
            await model.camera.start()
        }
        
    }
    
    
    private func buttonsView() -> some View {
        HStack {
            Spacer().frame(width: 145)
            // 사진 찍기 버튼
            Button {
                model.camera.takePhoto()
                model.resultString = ""
                isfounded = true
                
            } label: {
                Circle()
                    .foregroundStyle(Color.secondary)
                    .frame(width: 80, height: 80)
                    .padding()
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 40)
                    )
            }
            
            Spacer()
            
            // 전후면 카메라 교체
            Button {
                model.camera.switchCaptureDevice()
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
            }
            .frame(width: 75, height: 75)
            .padding()
            
        }
    }
    
    @ViewBuilder
    private func foundView(missionName: String) -> some View {
        VStack{
            
            Text("\(model.resultString)를 찾았어요!🎉🎉")
                .font(.title3)
                .padding(.vertical)

            HStack(spacing: 10) {
                Button{
                    isfounded.toggle()
                    model.resultString = ""
                } label: {Text("취소")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                        .frame(width: 120, height: 60)
                        .background(Color.secondary)
                        .cornerRadius(20)
                }
                
                Button{
                    isfounded.toggle()
                    model.resultString = ""
                    filteredMission!.pass = true
//                    cat.meetCount += 1
                    
                } label: {
                    Text("도감에 추가하기!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(width: 220, height: 60)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                }
            }
            Spacer().frame(height:20)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: 210)
        .background(.thickMaterial)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
    @ViewBuilder
    private func unfoundView() -> some View {
        VStack{
            
            Text("아무것도 찾지 못했어요 🥹")
                .font(.title3)
                .padding(.vertical)
            
            Button{
                isfounded.toggle()
                model.resultString = ""
            } label: {Text("취소")
                    .font(.title3)
                    .foregroundStyle(Color.white)
                    .frame(width: 120, height: 60)
                    .background(Color.secondary)
                    .cornerRadius(20)
            }
            
            
            Spacer().frame(height:20)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: 210)
        .background(.thickMaterial)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}


