//
//  ActivityRingView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ActivityRingView: View {
  @State private var animate: Bool = false
  let percent: Double
  let ringWidth: CGFloat
  let backgroundColor: Color
  let foregroundColor: Color
  let startAngle: Double = -90
  
  var body: some View {
    ZStack {
      RingShape()
        .stroke(style: StrokeStyle(lineWidth: ringWidth))
        .fill(backgroundColor)
      
      if percent > 0 {
        RingShape(
          percent: animate ? self.percent : 0,
          startAngle: self.startAngle)
        .stroke(style: StrokeStyle(lineWidth: self.ringWidth, lineCap: .round))
        .fill(self.foregroundColor)
        .onAppear {
          self.animate = false
          DispatchQueue.main.async {
            withAnimation(.linear(duration: 0.5)) {
              self.animate = true
            }
          }
        }
      }
    }
  }
}

struct ActivityRingView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityRingView(
      percent: 50, ringWidth: 20,
        backgroundColor: Color(red: 58/255, green: 24/255, blue: 29/255),
        foregroundColor: Color(red: 1.0, green: 0, blue: 0.0, opacity: 1))
    }
}
