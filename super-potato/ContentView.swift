//
//  ContentView.swift
//  super-potato
//

import SwiftUI

struct ContentView: View {
  @State private var count = 0
  @State private var coordBlock = CGPoint(x: 0, y: UIScreen.main.bounds.height / 2)
  @State private var clock = true
  @State private var position: CGPoint?
  @State private var radius: CGFloat = 125.0
  @State private var angle: CGFloat = 0.0
  @State private var speed: CGFloat = 0.1
  @State private var startTime: Date?
  
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    ZStack {
      Color("bg").edgesIgnoringSafeArea(.all)
      VStack {
        Text("\(count)")
          .font(.system(size: 64))
          .bold()
          .foregroundColor(.white)
          .padding()
        Spacer()
      }
      VStack {
        Spacer()
        ZStack {
          Circle()
            .foregroundColor(Color.black.opacity(0.1))
            .frame(width: radius * 2, height: radius * 2)
          
          Circle()
            .foregroundColor(Color("bg"))
            .frame(width: radius, height: radius)
          
          Circle()
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .position(x: position?.x ?? 0 + 50, y: position?.y ?? 0 + 50)
          
//          Rectangle()
//            .foregroundColor(Color("accent"))
//            .frame(width: 100, height: 50)
//            .padding()
//            .position(x: coordBlock.x, y: coordBlock.y)
        }
        Spacer()
        
      }.onReceive(self.timer) { (_) in
        withAnimation {
          if clock {
            self.angle += speed
          } else {
            self.angle -= speed
          }
          self.position = CGPoint(x: UIScreen.main.bounds.width / 2 + radius * cos(angle),
                                  y: UIScreen.main.bounds.height / 2 + radius * sin(angle))
        }
        
      }.onAppear {
        self.position = CGPoint(x: UIScreen.main.bounds.width / 2 + radius * cos(angle),
                                y: UIScreen.main.bounds.height / 2 + radius * sin(angle))
      }
    }.onTapGesture {
      self.clock.toggle()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
