//
//  ExerciseDetailView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ExerciseDetailView: View {
  @State var Title: String
  var body: some View {
    Text(Title)
  }
}

struct ExerciseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseDetailView(Title: "Test")
  }
}
