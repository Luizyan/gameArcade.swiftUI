//
//  elicoptero.swift
//  jogo arcade
//
//  Created by Luiz Yan on 25/09/25.
//

import SwiftUI

struct helicoptero: View{
    
    let rows = 5
    let col = 5
    let size: CGFloat = 10
    
    let heliblock: [[Color]] = [[.gray, .gray, .gray, .gray, .gray,],
                                [.clear, .clear, .gray, .clear, .clear,],
                                [.red, .red, .red, .blue, .blue,],
                                [.clear, .clear, .red, .red, .red,],
                                [.clear, .clear, .gray, .clear, .gray,]]
    
    var body: some View {
        VStack(spacing: 0){
            ForEach((0...self.rows - 1), id: \.self) { rows in
                HStack(spacing: 0){
                    ForEach((0...self.rows - 1), id: \.self) { col in
                        VStack{
                            pixel(size: self.size, color: self.heliblock[rows][col])
                        }
                    }
                }
            }
        }
    }
}
