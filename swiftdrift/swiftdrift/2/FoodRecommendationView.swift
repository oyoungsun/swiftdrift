//
//  FoodRecommendationView.swift
//  swiftdrift
//
//  Created by youngsun O on 9/22/24.
//

import SwiftUI
import MessageUI

struct FoodRecommendationView: View {
    @State private var storeName: String = ""
    @State private var storeLocation: String = ""
    @State private var showMailComposer = false
    @State private var showErrorAlert = false

    var body: some View {
        NavigationView {  // NavigationView로 감쌈
            VStack(alignment: .leading, spacing: 20) {
                Text("나만의 경북대 명소 추천하기")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("나만의 경북대 맛집부터 카페, 소품샵 등 내가 자주가는 인근 가게를 추천해보세요!")
                    .font(.footnote)
                    .fontWeight(.bold)

                TextField("가게 명", text: $storeName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                TextField("가게 위치", text: $storeLocation)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Button(action: {
                    if MFMailComposeViewController.canSendMail() {
                        showMailComposer = true
                    } else {
                        showErrorAlert = true
                    }
                }) {
                    Text("전송")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .sheet(isPresented: $showMailComposer) {
                    MailView(isShowing: $showMailComposer, storeName: storeName, storeLocation: storeLocation)
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("메일 전송 불가"), message: Text("메일을 전송할 수 없습니다. 설정에서 메일 계정을 확인해주세요."), dismissButton: .default(Text("확인")))
                }

                Spacer()
            }
            .padding()
            .navigationTitle("맛집 추천하기")  // NavigationView 내에서 제목 표시
        }
    }
}

#Preview {
    FoodRecommendationView()
}
