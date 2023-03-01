//
//  ExerciseListView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ExerciseListView: View {
  
  @State var exercises = [String]()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("운동")
          .font(.title2)
          .bold()
          .foregroundColor(.white)
        Spacer()
      }
      VStack(spacing: 4) {
        ForEach(exercises, id: \.self) { str in
          NavigationLink (destination: ExerciseDetailView(Title: str)) {
            ExerciseCardView()
          }
        }
      }
    }
    .background(.black)
  }
}

struct ExerciseListView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseListView(exercises: ["기능성 근력 강화 운동"])
  }
}
