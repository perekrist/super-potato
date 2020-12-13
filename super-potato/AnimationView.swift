//
//  AnimationView.swift
//  super-potato
//
//  Created by Кристина Перегудова on 26.10.2020.
//

import SwiftUI

struct AnimationView : View {
  var body: some View {
    VStack {
      
      ScaledShape(shape: Rectangle(), scale: CGSize(width: 0.5, height: 0.5))
        .overlay(Text("Scaled shape")
          .foregroundColor(.white))
      
      RotatedShape(shape: Rectangle(), angle: Angle(degrees: 45))
        .frame(width: 150, height: 150)
        .overlay(Text("Rotated shape")
          .foregroundColor(.white))
      
      Group {
        OffsetShape(shape: Rectangle(), offset: CGSize(width: 110, height: 50))
          .frame(width: 100, height: 100)
          .overlay(Text("Offset shape"))
      }
      .frame(height: 200)
    }
  }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
