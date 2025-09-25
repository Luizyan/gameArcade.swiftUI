//
//  ContentView.swift
//  jogo arcade
//
//  Created by Luiz Yan on 25/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       GeometryReader { geo in
           ZStack {
               helicoptero()
               obstaculo()
           }
           .edgesIgnoringSafeArea(.all)
           .frame(width: geo.size.width, height: geo.size.height)
           .background(Color.black)
        }
    }
}
