//
//  AboutScreen.swift
//  ScaffoldingApplicationSwiftUI
//
//  Created by Dmitrii on 14.04.2021.
//

import SwiftUI

struct AboutScreen: View {
    @State private var isOpened:Bool = false
    var body: some View {
        Button("Show modal") {
            isOpened.toggle()
        }
        .foregroundColor(.white)
        .background(Color.gray)
        .cornerRadius(5)
        .fullScreenCover(isPresented: $isOpened, content: {
            FullScreenModalView.init()
        })
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var text = NSMutableAttributedString(string: "This is modal window")
    var body: some View {
        Spacer(minLength: 150)
        VStack {
        TextView(text: $text)
        Button("Dismiss modal") {
            presentationMode.wrappedValue.dismiss()
        }
        .foregroundColor(.white)
        .background(Color.gray)
        .cornerRadius(5)
       Spacer(minLength: 50)
        }
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
        uiView.font = UIFont.systemFont(ofSize: 30)
        uiView.isEditable = false
        uiView.textAlignment = .center
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
