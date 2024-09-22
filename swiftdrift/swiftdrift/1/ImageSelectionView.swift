//
//  ImageSelectionView.swift
//  swiftdrift
//
//  Created by youngsun O on 9/22/24.
//

import SwiftUI

struct ImageSelectionView: View {
    @Binding var selectedImage: String?
    @Environment(\.presentationMode) var presentationMode // 현재 뷰의 상태를 관리
    
    let images: [(String, Image)] = [("cap1", Image("cap1")), ("cap2", Image("cap2")), ("hobanwoo", Image("hobanwoo"))] // 이미지 이름과 객체 쌍
    
    var body: some View {
        VStack {
            Text("이미지를 선택하세요")
                .font(.headline)
            
            ForEach(images, id: \.0) { imageName, image in
                Button(action: {
                    selectedImage = imageName // 선택한 이미지 이름 저장
                    presentationMode.wrappedValue.dismiss() // 이전 뷰로 돌아가기
                }) {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100) // 버튼 크기 조정
                }
                .padding()
            }
            
            Spacer()
        }
        .navigationTitle("이미지 선택")
        .padding()
    }
}


#Preview {
    NavigationStack {
        ImageSelectionView(selectedImage: .constant(nil)) // 더미 바인딩 제공
    }
}
