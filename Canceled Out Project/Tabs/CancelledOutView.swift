//
//  CancelledOutView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/3/23.
//

import SwiftUI

struct CancelledOutView: View {
    
    @Binding var plan: Plan?
    
    var body: some View {
        VStack {
            
            Image("cancelled-out-logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 400)
                .clipShape(Rectangle())
            
            VStack {
                Text("Cancelled Out!").font(.system(.largeTitle))
                    .fontWeight(.heavy)
                    .padding()
                
                Text("\(plan?.name ?? "Your Plan")").font(.system(.title)).fontWeight(.bold)
                Text("has been cancelled.").font(.system(.title2))
            }
            
            Spacer()

            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)){
                    self.plan = nil
                }
                
            }) {
                HStack {
                    Image(systemName: "arrow.backward")
                    Text("back to plans")
                }
            }
            .padding()
            .foregroundStyle(primaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(primaryColor, lineWidth: 1)
            )
            
            Spacer()

        }
        .padding(.horizontal, paddingHorizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground(startColor: primaryColor, endColor: disruptorColor))
        .foregroundColor(primaryColor)
    }
}

#Preview {
    ContentView()
}
