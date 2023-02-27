//
//  ProfileView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 0) {
        Text("2월 27일 월요일")
          .font(.caption)
          .foregroundColor(Color.gray)
        
        HStack {
          Text("요약")
            .foregroundColor(Color.white)
            .bold()
          Spacer()
          Text("🐶")
            .bold()
            .background(.gray)
            .clipShape(Circle())
          
        }.font(.largeTitle)
      }
    }
    .background(.black)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
