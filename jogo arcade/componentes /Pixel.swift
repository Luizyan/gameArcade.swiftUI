//
//  Pixel.swift
//  jogo arcade
//
//  Created by Luiz Yan on 25/09/25.
//
import SwiftUI

struct pixel: View{
    let size: CGFloat
    let color: Color
    
    var body: some View{
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
