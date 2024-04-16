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

            MyIcon()
                      
                      LinearGradient(gradient: Gradient(stops: [.init(color: Color(red: 0.85, green: 0.10, blue: 0.10), location: 0.00), .init(color: Color.black, location: 1.00)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                      Icon()
                          .stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/)
//
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
           
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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

struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.14619*width, y: 0.95989*height))
        path.addCurve(to: CGPoint(x: -0.02864*width, y: 0.62487*height), control1: CGPoint(x: 0.04455*width, y: 0.89853*height), control2: CGPoint(x: 0.01986*width, y: 0.75023*height))
        path.addCurve(to: CGPoint(x: -0.14401*width, y: 0.27896*height), control1: CGPoint(x: -0.07752*width, y: 0.49815*height), control2: CGPoint(x: -0.14931*width, y: 0.39133*height))
        path.addCurve(to: CGPoint(x: 0.06546*width, y: 0.01209*height), control1: CGPoint(x: -0.13911*width, y: 0.16524*height), control2: CGPoint(x: -0.05712*width, y: 0.04597*height))
        path.addCurve(to: CGPoint(x: 0.50924*width, y: 0.05079*height), control1: CGPoint(x: 0.18635*width, y: -0.02147*height), control2: CGPoint(x: 0.34652*width, y: 0.03203*height))
        path.addCurve(to: CGPoint(x: 0.9364*width, y: 0.11252*height), control1: CGPoint(x: 0.67066*width, y: 0.07121*height), control2: CGPoint(x: 0.83461*width, y: 0.05689*height))
        path.addCurve(to: CGPoint(x: 1.07601*width, y: 0.41828*height), control1: CGPoint(x: 1.03857*width, y: 0.1695*height), control2: CGPoint(x: 1.07858*width, y: 0.29642*height))
        path.addCurve(to: CGPoint(x: 0.94362*width, y: 0.74815*height), control1: CGPoint(x: 1.07344*width, y: 0.54015*height), control2: CGPoint(x: 1.02961*width, y: 0.65529*height))
        path.addCurve(to: CGPoint(x: 0.5779*width, y: 0.95652*height), control1: CGPoint(x: 0.85764*width, y: 0.84102*height), control2: CGPoint(x: 0.72912*width, y: 0.91026*height))
        path.addCurve(to: CGPoint(x: 0.14619*width, y: 0.95989*height), control1: CGPoint(x: 0.4246*width, y: 1.00173*height), control2: CGPoint(x: 0.24653*width, y: 1.02292*height))
        path.closeSubpath()
        return path
    }
}
struct Icon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.89593*width, y: 0.11958*height))
        path.addCurve(to: CGPoint(x: 1.19949*width, y: 0.31887*height), control1: CGPoint(x: 1.02791*width, y: 0.17572*height), control2: CGPoint(x: 1.18064*width, y: 0.23887*height))
        path.addCurve(to: CGPoint(x: 1.02037*width, y: 0.622*height), control1: CGPoint(x: 1.21646*width, y: 0.39886*height), control2: CGPoint(x: 1.09956*width, y: 0.4971*height))
        path.addCurve(to: CGPoint(x: 0.7828*width, y: 0.96443*height), control1: CGPoint(x: 0.94118*width, y: 0.74831*height), control2: CGPoint(x: 0.90159*width, y: 0.90128*height))
        path.addCurve(to: CGPoint(x: 0.32274*width, y: 0.92795*height), control1: CGPoint(x: 0.66401*width, y: 1.02618*height), control2: CGPoint(x: 0.46604*width, y: 0.99671*height))
        path.addCurve(to: CGPoint(x: 0.00598*width, y: 0.63744*height), control1: CGPoint(x: 0.17944*width, y: 0.85777*height), control2: CGPoint(x: 0.09082*width, y: 0.74831*height))
        path.addCurve(to: CGPoint(x: -0.13167*width, y: 0.32027*height), control1: CGPoint(x: -0.07887*width, y: 0.52657*height), control2: CGPoint(x: -0.15995*width, y: 0.4157*height))
        path.addCurve(to: CGPoint(x: 0.1587*width, y: 0.08871*height), control1: CGPoint(x: -0.10527*width, y: 0.22484*height), control2: CGPoint(x: 0.0286*width, y: 0.14625*height))
        path.addCurve(to: CGPoint(x: 0.53391*width, y: 0.0031*height), control1: CGPoint(x: 0.2888*width, y: 0.03117*height), control2: CGPoint(x: 0.41701*width, y: -0.00532*height))
        path.addCurve(to: CGPoint(x: 0.89593*width, y: 0.11958*height), control1: CGPoint(x: 0.6527*width, y: 0.01012*height), control2: CGPoint(x: 0.76394*width, y: 0.06204*height))
        path.closeSubpath()
        return path
    }
}
