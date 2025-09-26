//
//  ContentView.swift
//  jogo arcade
//
//  Created by Luiz Yan on 25/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var heliPosition = CGPoint(x: 50, y: 100)
    @State private var obstaclePosition = CGPoint(x: 700, y: 250)
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common) .autoconnect()
    
    var body: some View {
        
        
       GeometryReader { geo in
           ZStack {
               helicoptero()
                   .position(self.heliPosition)
                   .onReceive(self.timer) { _ in
                        self.gravity()
                    }
               obstaculo()
                   .position(self.obstaclePosition)
                   .onReceive(self.timer) { _ in
                       self.obsmove()
                   }
               
               VStack{
                   Button("Pause") {
                       self.timer.upstream.connect().cancel()
                   }
                 
                   Button("Restart") {
                       self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                   }
               }
               
           }
           .frame(width: geo.size.width, height: geo.size.height)
           .background(Color.white)
           .gesture(
            TapGesture()
                .onEnded ({ _ in
                    withAnimation {
                        self.heliPosition.y -= 100
                    }
                })
           )
        }
       .edgesIgnoringSafeArea(.all)
    }
    func gravity(){
        withAnimation{
            self.heliPosition.y += 10
        }
        if self.heliPosition.y > 500{
            self.heliPosition.y = 100
        }
    }
    func obsmove(){
        if self.obstaclePosition.x > 0{
            withAnimation{
                self.obstaclePosition.x -= 20
            }
        }else{
            self.obstaclePosition.x = 1000
        }
    }
    
    func Pause(){
        self.timer.upstream.connect().cancel()
    }
    func Restart(){
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    }
//    func colision(){
//        
//    }
//    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
