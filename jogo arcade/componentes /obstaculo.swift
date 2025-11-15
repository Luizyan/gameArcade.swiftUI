


import SwiftUI
struct obstaculo: View {
    let height: CGFloat = 200
    let width: CGFloat = 20
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.green)
    }
}
