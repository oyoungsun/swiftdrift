//
//  MailView.swift
//  swiftdrift
//
//  Created by youngsun O on 9/22/24.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    var storeName: String
    var storeLocation: String

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool

        init(isShowing: Binding<Bool>) {
            _isShowing = isShowing
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            isShowing = false
            controller.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject("나만의 경북대 맛집 추천")
        vc.setToRecipients(["your_email@example.com"])
        
        let messageBody = """
        가게 명: \(storeName)
        가게 위치: \(storeLocation)
        """
        vc.setMessageBody(messageBody, isHTML: false)

        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {}
}
