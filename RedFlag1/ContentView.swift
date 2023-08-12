//
//  ContentView.swift
//  RedFlag1
//
//  Created by noor alotibi on 23/01/1445 AH.
//
//
import SwiftUI
import CoreML
struct ContentView: View {
    @State private var text: String = ""
    @State private var image: UIImage?
    @State private var inputText = ""
    @State private var classificationLabel = ""

    var body: some View {
        ZStack {

            Image("Image")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(maxWidth: .infinity)
            VStack {
           
                    TextField("Type or paste your text here..", text: $inputText,axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 332.00)
                        .frame(height: 72.00)
                        .padding(33)
                Button {
                text = UIPasteboard.general.string ?? ""
                }label: {
               
                }
                VStack{
                    HStack{
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(red: 0.42, green: 0.46, blue: 0.49))
                                .frame(width: 104.00, height: 30.00)
                            
                            Button("Detect") {
                                
                                if let label = classifyText(inputText) {
                                    classificationLabel = label
                                } else {
                                    classificationLabel = "Error classifying text"
                                }
                            }
                        }
                        .font(Font.custom("NunitoSans-Bold", size: 14))
                        .kerning(0.40)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 54.00, minHeight: 19.00, alignment: .top)
                        
                        Button {
                            classificationLabel = ""
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(red: 0.91, green: 0.47, blue: 0.47))
                                    .frame(width: 104.00, height: 30.00)
                                Text("Cancel")
                                    .font(Font.custom("NunitoSans-Bold", size: 14))
                                    .kerning(0.40)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.white)
                                    .frame(minWidth: 51.27, minHeight: 17.78, alignment: .top)
                            }
                        }
                    }
                 
                    if classificationLabel == "spam" {
                        Text("Scam detected, you should be careful!\nWe recommend you to report the scam to the authority.")
                            .font(Font.custom("NotoSans-DisplayRegular", size: 22))
                            .foregroundColor(Color.white)
                            .bold()
                    } else if classificationLabel == "ham" {
                        Text("This is not a spam message.")
                            .font(Font.custom("NotoSans-DisplayRegular", size: 22))
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
                   
                     

}
.padding()
           
                }
            }
        }
func classifyText(_ text: String) -> String? {
    guard let model = try? SPAMClassifier(configuration: MLModelConfiguration()) else {
        return nil
    }
    
    guard let prediction = try? model.prediction(text: text) else {
        return nil
    }
    
    return prediction.label
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

