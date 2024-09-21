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
                    .foregroundColor(.green)
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
                    //                .background(.green)
                }
                .padding(20)
            }
            .ignoresSafeArea()
        }
        
        .navigationBarTitle("선정", displayMode: .inline)
        .toolbar(.hidden, for: .tabBar)
        
        
        
    }
    
    
    private func createDecoButton(title: String) -> some View {
        Text(title)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(width: 80, height: 40)
        
            .background(selectedDeco != title ? Color.white  : Color.gray)
            .cornerRadius(40)

            .onTapGesture {
                if selectedDeco != title {
                    selectedDeco = title
                }
            }
    }
}





#Preview {
    NavigationStack{
        DecorateView(selectedDeco: nil)
    }
}
