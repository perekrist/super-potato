//
//  PrizeView.swift
//  super-potato
//

import SwiftUI

struct PrizeView: View {
  
  var body: some View {
    Rectangle()
      .foregroundColor(.white)
      .frame(width: 20, height: 20)
      .padding()
      .rotationEffect(Angle(degrees: 45))
      .offset(x: -100)
  }
}
