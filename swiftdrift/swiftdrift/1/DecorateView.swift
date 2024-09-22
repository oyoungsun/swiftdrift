//
//  DecorateView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/21/24.
//

import SwiftUI

struct DecorateView: View {
    @State var selectedDeco: String!
    
    
    var door: [String] = ["정문", "북문","쪽문", "나리문", "동문"]
    var deco: [String] = ["모자", "옷", "장식"]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
        
    ]
    var body: some View {
        ZStack {
            LinearGradient(
                   gradient: Gradient(colors: [.red, Color("Color2")]),
                   startPoint: .top,
                   endPoint: .bottom
               )
               .ignoresSafeArea() // 안전 영역 무시
            VStack{
                //            Rectangle()
                //                .frame(height: 200)
                Image("hobanwoo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Text("Hello, World!")
                
                ZStack{
                    Rectangle()
                        .frame(width: .infinity)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    VStack{
                        HStack{
                            ForEach(deco, id: \.self) {i in
                                createDecoButton(title: i)
                            }
                            .padding(.bottom, 20)
                            


                        }
                        ScrollView {
                            LazyVGrid(
                                columns: columns,
                                alignment: .leading,
                                spacing: 6,
                                pinnedViews: [],
                                content: {
                                    
                                    ForEach(door, id: \.self) {i in
                                        NavigationLink(destination: EmptyView(),
                                                       label:{
                                            VStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: 60, height: 60)
                                                
                                                Text(i)
                                                    .foregroundColor(.secondary)
                                            }
                                        })
                                    }
                                }
                            )
                        }
    //                                    .background(.green)
                    }
                    .padding(20)
                }
                .ignoresSafeArea()
            }
        }

        
        .navigationBarTitle("선정", displayMode: .inline)
        .toolbar(.hidden, for: .tabBar)
        
        
        
    }
    
    
    private func createDecoButton(title: String) -> some View {
        Text(title)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(width: 80, height: 40)
            .background(selectedDeco == title ? Color.gray.opacity(0.5) : Color.white)
            .cornerRadius(40)
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2) // 그림자 추가
            .onTapGesture {
                selectedDeco = (selectedDeco == title) ? "" : title // 선택 시 초기화
            }
    }

}





#Preview {
    NavigationStack{
        DecorateView(selectedDeco: nil)
    }
}
