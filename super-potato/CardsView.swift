//
//  CardsView.swift
//  super-potato
//

import SwiftUI

struct CardsView: View {
  @State var offset: CGSize = .zero
  var body: some View {
    ZStack {
      Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
      ForEach(0..<5) { i in
        GeometryReader { geo in
          Rectangle()
            .frame(width: 200, height: 300)
            .foregroundColor(.orange)
            .cornerRadius(12)
            .offset(x: offset.width, y: 0)
            .rotationEffect(.degrees(Double(self.offset.width / geo.size.width) * 25), anchor: .bottom)
            .padding()
        }.gesture(
          DragGesture()
            .onChanged { amount in
              self.offset = amount.translation
            }
            .onEnded { amount in
              self.offset = .zero
            }
        )
      }
    }
  }
}

struct CardsView_Previews: PreviewProvider {
  static var previews: some View {
    CardsView()
  }
}
