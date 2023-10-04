//
//  AddPlanFormView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 9/30/23.
//

import SwiftUI

struct AddPlanFormView: View {
    @State private var planName: String = ""
    @State private var planDescription: String = ""
    @State private var planDate: Date = Date()
    @State private var planFriends: [User] = [
        User(name: "Richard", profileImage: "richard-image"),
        User(name: "Crystal", profileImage: "crystal-image"),
        User(name: "Jack", profileImage: "jack-image")
    ]
    
    private let iconWidth : CGFloat = 40
    private let iconHeight : CGFloat = 40

    func addFriendToPlan() {
        print("add friend to plan")
    }
    
    var body: some View {
        VStack (spacing: standardSpacing) {
            
            DateHeaderView()
            
            HStack {
                Text("New Plan").font(.system(.title2)).foregroundStyle(disruptorColor)
                Spacer()
            }
            
            VStack {
                Section(header: HStack {
                    Text("Title").font(.system(.title3)).foregroundStyle(disruptorColor)
                    Spacer()
                }) {
                    TextField("Plan Name", text: $planName).background(primaryColor).foregroundStyle(disruptorColor)
                }
                
                Section(header: HStack {
                    Text("What are you doing?").font(.system(.title3)).foregroundStyle(disruptorColor)
                    Spacer()
                }) {
                    TextField("Details", text: $planDescription).background(primaryColor).foregroundStyle(disruptorColor)
                }
                
                Section(header: HStack {
                    Text("When is your plan?").font(.system(.title3)).foregroundStyle(disruptorColor)
                    Spacer()
                }) {
                    DatePicker("", selection: $planDate, displayedComponents: [.date, .hourAndMinute]).labelsHidden()
                    
                }
                
                Spacer()
                
                VStack (spacing: standardSpacing) {
                    HStack{
                        Text("Add your friends").font(.system(.title3)).foregroundStyle(disruptorColor)
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Button (action: {
                               addFriendToPlan()
                            }) {
                                SystemCircularIcon(imageName: "person.badge.plus", width: iconWidth, height: iconHeight, padding: 4)
                            }
                            
                            ForEach(planFriends.indices, id: \.self) { index in
                                CircularIcon(imageName: planFriends[index].profileImage, width: iconWidth, height: iconHeight).offset(x: (CGFloat(index + 1) * iconWidth / 2))
                            }
                        }
                        
                        Spacer()
                    }
                    
                    HStack (spacing: standardSpacing) {
                        Button(action: {
                            // Handle form submission
                        }) {
                            Text("Cancel")
                        }
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(disruptorColor)
                        .background(primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(disruptorColor, lineWidth: 1)
                        )
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle form submission
                        }) {
                            Text("Create Plan")
                        }
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(primaryColor)
                        .background(disruptorColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).stroke(disruptorColor, lineWidth: 1)
                        )
                    }
                    
                }.padding()
                
            }
        }.padding(.horizontal, paddingHorizontal)
    }
}

#Preview {
    AddPlanFormView()
}
