//
//  Rebort.swift
//  RedFlag1
//
//  Created by noor alotibi on 24/01/1445 AH.
//

import SwiftUI

struct Rebort: View {
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
                    Text("How to report scam?")
                        .font(Font.custom("NotoSans-DisplaySemiBold", size: 18))
                       
                        .padding(-148.0)
                        .padding(.leading,95)
                        .kerning(0.0)
                        .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        .lineLimit(1)
                        .frame(minWidth: 142.00, minHeight: 19.00, alignment: .topLeading)
                    Text("To report fraud, whether it's a phone call \nor an SMS message, send it to: 330330.")
                        .font(Font.custom("NotoSans-DisplaySemiBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .padding(-128)
                        .padding(.leading,5)
                        .kerning(-0.55)
                        .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))

                        .multilineTextAlignment(.leading)
                    Link(destination: URL(string: "http://filter.sa")!) {
                        Text("To report a suspicious website, use \nthe following website:filter.sa.")
                        .font(Font.custom("NotoSans-DisplaySemiBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .padding(-72)
                        .padding(.leading,-2)
                        .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                    }
                }
            )
        }

                }
                    
                
        }
 
struct Rebort_Previews: PreviewProvider {
    static var previews: some View {
        Rebort()
    }
}
