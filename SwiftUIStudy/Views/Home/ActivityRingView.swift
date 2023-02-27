//
//  ActivityRingView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ActivityRingView: View {
  @State private var animate: Bool = false
  let ringWidth: CGFloat
  let percent: Double
  let backgroundColor: Color
  let foregroundColor: Color
  let startAngle: Double = -90
  
    var body: some View {
      ZStack {
        RingShape()
          .stroke(style: StrokeStyle(lineWidth: ringWidth))
          .fill(backgroundColor)
        
        RingShape(
          percent: animate ? self.percent : 0,
          startAngle: self.startAngle)
        .stroke(style: StrokeStyle(lineWidth: self.ringWidth, lineCap: .round))
        .fill(self.foregroundColor)
      }
      .onAppear {
        withAnimation(.linear(duration: 0.5)) {
          animate.toggle()
        }
      }
    }
}

struct ActivityRingView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityRingView(
      ringWidth: 20,
      percent: 50,
        backgroundColor: Color(red: 58/255, green: 24/255, blue: 29/255),
        foregroundColor: Color(red: 1.0, green: 0, blue: 0.0, opacity: 1))
    }
}
