//
//  SplachScreenView.swift
//  MoneyGrow
//
//  Created by noor alotibi on 27/11/1444 AH.
//
import Foundation
import SwiftUI

struct SplashScreenView: View {

    @State private var isActive = false
     @State private var size = 0.8
     @State private var opacity = 0.5
     @State private var presentOnbording = false
     @State private var size1 = 0.6
     @State private var opacity1 = 1.0
     @State  var offset: Int
    
var body: some View {

    NavigationView{
        VStack{
    
            Image("logo1")
                    .resizable()
                    .frame(width: 550,height: 750)
     
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 2.0)) {
                    self.size = 0.5
                    self.opacity = 1.00
                }
            }
            .fullScreenCover(isPresented: $presentOnbording) {
                tab()
            }
           
            
        }

        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation {
                    self.isActive = true
                    presentOnbording.toggle()
                }
            }
        }

    }
    }

struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
                 SplashScreenView(offset: 1)

     }
}
