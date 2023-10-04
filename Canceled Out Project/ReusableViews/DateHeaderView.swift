//
//  DateHeaderView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/1/23.
//

import SwiftUI

struct DateHeaderView: View {
    
    var todaysDate = formattedDate(date: Date())

    var body: some View {
        HStack {
            Text(todaysDate).font(.title2).foregroundColor(disruptorColor).padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/).padding(.vertical, 10.0)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(primaryColor)
                        .strokeBorder(disruptorColor, lineWidth: 1)
                )
        }
    }
}

#Preview {
    DateHeaderView()
}
