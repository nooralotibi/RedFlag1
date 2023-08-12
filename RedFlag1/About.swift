//
//  About.swift
//  RedFlag1
//
//  Created by noor alotibi on 24/01/1445 AH.
//

import SwiftUI

struct About: View {
    var body: some View {
        ZStack {
            Image("Image")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(maxWidth: .infinity)
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white)
                .frame(width: 269, height: 414)
                .overlay(
                    VStack {
                        Text("About RedFlag")
                            .font(Font.custom("NotoSans-DisplaySemiBold", size: 18))
                            .bold()
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))

                            .padding(.leading, -128.0)
                            .padding(.bottom,-6)
                     Text("")
                        Text("RedFlag is an application that aims to use modern Artificial Intelligence (AI) technologies to detect fraud in texts.\nThe mobile application uses Machine Learning algorithms and Deep Neural Networks to analyze texts and classify them into one of two classes,\nspam or non-spam. Additionally, the accuracy of the prediction is high.")
                   
                            .font(Font.custom("NotoSans-DisplayRegular", size: 16))
                            .kerning(0.40)
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .multilineTextAlignment(.leading)

                    } .padding(.leading, 4.0)
                        .padding(.top,-54)
                )
        }

        }
    }

struct TextModifier: ViewModifier {
  let spam: (Text) -> Text
  let nonSpam: (Text) -> Text

  func body(content: Content) -> some View {
    content.modifier(
      TextModifier(
        spam: { text in
          text.foregroundColor(.red)
        },
        nonSpam: { text in
          text.foregroundColor(.green)
        }
      )
    )
  }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
