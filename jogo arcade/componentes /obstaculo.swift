//
//  obstaculo.swift
//  jogo arcade
//
//  Created by Luiz Yan on 25/09/25.
//

import SwiftUI
struct obstaculo: View {
    let height: CGFloat = 20
    let width: CGFloat = 200
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.green)
    }
}
