//
//  tab.swift
//  RedFlag1
//
//  Created by noor alotibi on 24/01/1445 AH.
//

import SwiftUI

struct tab: View {
    var body: some View {
        TabView{
            ContentView()
        .tabItem{Label("Detect", systemImage: "mail.and.text.magnifyingglass")}
           
            About()
        .tabItem{Label("Report Scam", systemImage: "shield")}
            Rebort()
        .tabItem{Label("About", systemImage: "info.circle")}

                }
        .accentColor(Color(hue: 0.015, saturation: 0.809, brightness: 0.675))
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        tab()
    }
}
