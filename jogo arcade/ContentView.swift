//
//  ContentView.swift
//  jogo arcade
//
//  Created by Luiz Yan on 25/09/25.
//

import SwiftUI

struct ContentView: View {
    //posição inicial dos elementos
    @State private var heliPosition = CGPoint(x: 50, y: 100)
    @State private var obstaclePosition = CGPoint(x: 700, y: 300)
    
    // Ação da animação
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // botão de pause
    @State private var isPause = false
    
    var body: some View {
        
        // os elementos do jogo
        GeometryReader { geo in
            ZStack {
                helicoptero()
                    .position(self.heliPosition)
                    .onReceive(self.timer) { _ in
                        if !self.isPause {
                            self.gravity()
                        }
                    }
                obstaculo()
                    .position(self.obstaclePosition)
                    .onReceive(self.timer) { _ in
                        if !self.isPause {
                            self.obsmove()
                        }
                    }
                VStack{
                    HStack{
                        Button(isPause ? "PLAY":"PAUSE" ){
                            self.togglePause()
                        }
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding()
            }
            //area de toque
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.white)
            .gesture(
                TapGesture()
                    .onEnded ({ _ in
                        if !self.isPause{
                            withAnimation {
                                self.heliPosition.y -= 150
                            }
                        }
                    })
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
    // função que faz o helicoptero cair
    func gravity(){
        withAnimation{
            self.heliPosition.y += 20
        }
        if self.heliPosition.y > 500 || self.heliPosition.y < -50{
            self.heliPosition.y = 100
        }
    }
    
    //função que faz o obstaculo se mover
    func obsmove(){
        if self.obstaclePosition.x > 0{
            withAnimation{
                self.obstaclePosition.x -= 20
            }
        }else{
            self.obstaclePosition.x = 1000
        }
    }
    //função para pausar o jogo
    func togglePause(){
        self.isPause.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
