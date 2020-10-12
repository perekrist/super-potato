//
//  GameView.swift
//  super-potato
//

import SwiftUI

struct GameView: View {
  @State private var score = 0
  @State private var clock = true
  @State private var radius: CGFloat = 125.0
  @State private var angle: CGFloat = 0.0
  @State private var speed: CGFloat = 0.15
  @State private var blockSpeed: CGFloat = 15.0
  @State var coordBlock: CGPoint = CGPoint(x: 0.0, y: 0.0)
  @State var center: CGPoint = CGPoint(x: 0.0, y: 0.0)
  
  let timer = Timer.publish(every: 0.1, on: .current, in: .common).autoconnect()

  var body: some View {
    GeometryReader { geo in
      ZStack {
        Color("bg").edgesIgnoringSafeArea(.all)
        VStack {
          Text("\(score)")
            .fontWeight(.bold)
            .font(.system(size: 64))
            .foregroundColor(.white)
            .padding()
          Spacer()
        }
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
            
            BlockView(coord: self.coordBlock)
              .onAppear {
                coordBlock = CGPoint(x: -10, y: CGFloat.random(in: (geo.size.height/2 - radius)..<(geo.size.height/2 + radius)))
              }
            PrizeView()
              .position(x: coordBlock.x, y: coordBlock.y)
              
          }
        }
      }
    }.onReceive(self.timer) { (_) in
      updateBall()
      updateBlock()
    }.onTapGesture {
      self.clock.toggle()
    }
  }
  
  func updateBall() {
    withAnimation {
      if clock {
        self.angle += speed
      } else {
        self.angle -= speed
      }
    }
  }
  
  func updateBlock() {
    withAnimation {
      coordBlock.x += blockSpeed
    }
    if coordBlock.x > UIScreen.main.bounds.width + 200 {
      coordBlock = CGPoint(x: -50, y: CGFloat.random(in: (UIScreen.main.bounds.height/2 - 100)..<(UIScreen.main.bounds.height/2 + 100)))
    }
  }
}

struct GameView_Previews: PreviewProvider {
  static var previews: some View {
    GameView()
  }
}
