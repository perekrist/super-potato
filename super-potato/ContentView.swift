//
//  ContentView.swift
//  super-potato
//

import SwiftUI

struct ContentView: View {
  @State private var count = 0
  @State private var coordBlock = CGPoint(x: 0, y: UIScreen.main.bounds.height / 2)
  @State private var clock = true
  @State private var position: CGFloat = 0.0
  
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
      VStack(alignment: .center) {
        Spacer()
        ZStack {
          Circle()
            .foregroundColor(Color.black.opacity(0.1))
            .frame(width: 250, height: 250)
          
          Circle()
            .foregroundColor(Color("bg"))
            .frame(width: 125, height: 125)
          
          Circle()
            .trim(from: position, to: position + 0.001)
            .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(.white)
            .frame(width: 188, height: 188)
          
          Rectangle()
            .foregroundColor(Color("accent"))
            .frame(width: 100, height: 50)
            .padding()
            .position(x: coordBlock.x, y: coordBlock.y)
        }
        Spacer()
        
      }.onReceive(self.timer) { (_) in
        withAnimation {
          self.coordBlock = CGPoint(x: self.coordBlock.x + 10, y: self.coordBlock.y)
          self.position += 0.1
          print(position)
        }
        if self.coordBlock.x > UIScreen.main.bounds.width + 100 {
          self.coordBlock = CGPoint(x: -100, y: UIScreen.main.bounds.height / 2)
        }
        if self.position >= 1 {
          self.position -= 1
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
