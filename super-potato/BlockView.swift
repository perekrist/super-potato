//
//  BlockView.swift
//  super-potato
//

import SwiftUI

struct BlockView: View {
  var coord: CGPoint
  
  init(coord: CGPoint) {
    self.coord = coord
  }
  
  var body: some View {
    Rectangle()
      .foregroundColor(Color("accent"))
      .frame(width: 100, height: 50)
      .padding()
      .position(x: coord.x, y: coord.y)
  }
}
