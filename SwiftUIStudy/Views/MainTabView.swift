//
//  MainTabView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct MainTabView: View {
  @State private var selection = 0
  
  var body: some View {
    TabView(selection: $selection) {
      HomeView()
        .tabItem {
          Image(systemName: "house.circle.fill")
          Text("Home")
        }
      SecondView()
        .tabItem {
          Image(systemName: "list.bullet")
          Text("Second")
        }
    }
    .onAppear() {
      UITabBar.appearance().unselectedItemTintColor = .darkGray
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
