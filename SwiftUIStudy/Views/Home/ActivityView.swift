//
//  ActivityView.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/02/27.
//

import SwiftUI

struct ActivityView: View {
  @Binding var activityModel: ActivityModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("활동")
          .font(.title2)
          .bold()
          .foregroundColor(.white)
        Spacer()
      }
      VStack {
          HStack {
            VStack(alignment: .leading, spacing: 5) {
              VStack(alignment: .leading) {
                Text("움직이기")
                  .foregroundColor(Color.white)
                
                Text("\(activityModel.activeEnergyBurned.activeEnergyBurnedStr) / \(activityModel.activeEnergyBurned.activeEnergyBurnedGoalStr)")
                      .fontWeight(.bold)
                      .foregroundColor(Color.red)
                       }
                       
                       VStack(alignment: .leading) {
                  Text("운동하기")
                    .foregroundColor(Color.white)
                  
                  Text("0/40분")
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
              }
              
              VStack(alignment: .leading) {
                Text("일어서기")
                  .foregroundColor(Color.white)
                
                Text("1/6시간")
                  .fontWeight(.bold)
                  .foregroundColor(Color.cyan)
              }
            }
            Spacer()
            ZStack {
              ActivityRingView(
                percent: activityModel.activeEnergyBurned.activeEnergyBurnGoalPercent, ringWidth: 13,
                backgroundColor: Color(red: 58/255, green: 24/255, blue: 29/255),
                foregroundColor: .red)
              .frame(width: 100, height: 100, alignment: .center)

              ActivityRingView(
                percent: 40, ringWidth: 13,
                backgroundColor:  Color(red: 33/255, green: 56/255, blue: 27/255),
                foregroundColor: .green)
              .frame(width: 70, height: 70, alignment: .center)

              ActivityRingView(
                percent: 20, ringWidth: 13,
                backgroundColor:  Color(red: 23/255, green: 52/255, blue: 59/255),
                foregroundColor: .blue)
              .frame(width: 40, height: 40, alignment: .center)
            }
          }
          .padding()
        
        Divider()
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 2)
          .overlay(.black)
        
        HStack {
          VStack(alignment: .leading) {
            Text("걸음")
              .foregroundColor(Color.white)
            
            Text("282")
              .fontWeight(.bold)
              .foregroundColor(.gray)
          }
          
          Spacer()
          Spacer()
          
          VStack(alignment: .leading) {
            Text("거리")
              .foregroundColor(Color.white)
            
            Text("0.20KM")
              .fontWeight(.bold)
              .foregroundColor(.gray)
          }
          
          Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 150))
      }
      .background(Color(red: 28/255, green: 27/255, blue: 29/255))
      .cornerRadius(5)
    }
    .background(.black)
  }
}

struct ActivityView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityView(activityModel: .constant(ActivityModel(
      activeEnergyBurned: ActiveEnergyBurned(activeEnergyBurned: 300.0,
                                             activeEnergyBurnedGoal: 600.0),
      exerciseTime: 20.0,
      exerciseTimeGoal: 30.0,
      exerciseTimePercent: 20.0 / 30.0,
      standMinute: 1.0,
      standGoalMinute: 12.0,
      standPercent: 1.0 / 12.0)))
  }
}
