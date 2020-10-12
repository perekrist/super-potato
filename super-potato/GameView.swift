//
//  GameView.swift
//  super-potato
//

import SwiftUI

struct GameView: View {
  @State private var clock = true
  @State private var radius: CGFloat = 125.0
  @State private var angle: CGFloat = 0.0
  @State private var speed: CGFloat = 0.15
  
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

  var body: some View {
    GeometryReader { geo in
      ZStack {
        Color("bg").edgesIgnoringSafeArea(.all)
        VStack {
          ZStack {
            Circle()
              .foregroundColor(Color.black.opacity(0.1))
              .frame(width: radius * 2, height: radius * 2)
            
            Circle()
              .foregroundColor(Color("bg"))
              .frame(width: radius, height: radius)
            
            Circle()
              .foregroundColor(.white)
              .frame(width: radius / 2 - 10, height: radius / 2 - 10)
              .position(x: geo.size.width / 2 + (radius - radius/4) * cos(angle),
                        y: geo.size.height / 2 + (radius - radius/4) * sin(angle))
          }
        }
      }
    }.onReceive(self.timer) { (_) in
      withAnimation {
        if clock {
          self.angle += speed
        } else {
          self.angle -= speed
        }
      }
    }.onTapGesture {
      self.clock.toggle()
    }
  }
}

struct GameView_Previews: PreviewProvider {
  static var previews: some View {
    GameView()
  }
}
