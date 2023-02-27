//
//  ExerciseCardView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ExerciseCardView: View {
  var body: some View {
    HStack {
//      Image("strengthtraining")
//        .resizable()
//        .aspectRatio(34/43, contentMode: .fit)
//        .frame(minWidth: 30, maxWidth: 30)
//        .padding()
      
      
      VStack(alignment: .leading) {
        Text("기능성 근력 강화 운동")
          .foregroundColor(.white)
        Text("692CAL")
          .font(.title2)
          .fontWeight(.semibold)
          .foregroundColor(.green)
      }
      
      Spacer()
      
      VStack {
        Text("일요일 >")
          .font(.caption)
          .foregroundColor(.gray)
          .padding([.top, .trailing])
      }
    }
    .background(.black)
  }
}

struct ExerciseCardView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseCardView()
      .frame(width: 350, height: 80, alignment: .center)
  }
}
