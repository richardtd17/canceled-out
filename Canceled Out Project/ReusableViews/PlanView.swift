//
//  PlanView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 9/30/23.
//

import SwiftUI

let iconWidth:CGFloat = 32
let iconHeight:CGFloat = 32
let planCardHeight:CGFloat = 50

func formatPlanDate(date: Date) -> String {
    let calendar = Calendar.current
    if calendar.isDateInToday(date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "@ h:mma"
        return "Today \(dateFormatter.string(from: date))"
    } else {
        let day = calendar.component(.day, from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d yyyy @ h:mma"
        var formattedDateStr = dateFormatter.string(from: date)
        formattedDateStr = formattedDateStr.replacingOccurrences(of: " \(day) ", with: " \(day.ordinal) ")
        return formattedDateStr
    }
}

struct PlanView: View {
    var plan: Plan
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    HStack {
                        Text("\(formatPlanDate(date: plan.date))")
                            .font(.headline).foregroundStyle(disruptorColor)
                        Spacer()
                    }
                    HStack {
                        Text(plan.name)
                            .font(.subheadline).foregroundStyle(secondaryColor)
                        Spacer()
                    }
                }
                
                Spacer()
                
                ZStack {
                    SystemCircularIcon(imageName: "person.badge.plus", width: iconWidth, height: iconHeight, padding: 4)
                    
                    ForEach(plan.friends.indices, id: \.self) { index in
                        CircularIcon(imageName: plan.friends[index].profileImage, width: iconWidth, height: iconHeight).offset(x: -(CGFloat(index + 1) * iconWidth / 2))
                    }
                }
            }
            .padding(.horizontal).frame(height: planCardHeight)
        }
        .padding(.vertical, 10.0)
        .frame(maxWidth: .infinity)
        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(disruptorColor, lineWidth: 1).fill(primaryColor)        .strokeBorder(disruptorColor, lineWidth: 1)

                    )
    }
}

#Preview {
    ContentView()
}
