//
//  ExerciseCardView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ExerciseCardView: View {
  var body: some View {
    ZStack {
      Color.secondary
      HStack(alignment: .center) {
        Image("strengthtraining")
          .resizable()
          .aspectRatio(34/43, contentMode: .fit)
          .frame(maxHeight: 40)
          .padding()
        
        VStack(alignment: .leading) {
          Text("기능성 근력 강화 운동")
            .foregroundColor(.white)
          Text("692CAL")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.green)
        }
        
        Spacer()
        
        Text("일요일 >")
          .font(.caption)
          .foregroundColor(Color(UIColor.lightGray))
          .frame(minHeight: 40, alignment: .bottom)
          .padding(.trailing)
      }
    }
    .cornerRadius(5)
  }
}

struct ExerciseCardView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseCardView()
      .background(.black)
  }
}
