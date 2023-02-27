//
//  HomeView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 15.0) {
          ProfileView()
          ActivityView()
          ExerciseListView(exercises: ["Test"])
          Spacer()
        }
        .padding(.horizontal, 10.0)
        
      }
      .background(.black)
      .navigationBarHidden(true)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
