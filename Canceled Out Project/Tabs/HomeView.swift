//
//  HomeView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/1/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        VStack (spacing: standardSpacing) {
                        
            DateHeaderView()
            
            Section {
                VStack(spacing: standardSpacing) {
                    HStack {
                        Text("let's cancel some plans...").font(.title2)
                        Spacer()
                        AddMenu(selectedTab: $selectedTab) {
                            AddIcon()
                        }
                    }.foregroundStyle(disruptorColor)
                    ScrollView {
                        VStack(spacing: standardSpacing) {
                            ForEach(plansArray.indices, id: \.self) { index in
                                PlanView(plan: plansArray[index])
                            }
                            
                            AddMenu(selectedTab: $selectedTab) {
                                HStack {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .foregroundStyle(primaryColor)
                                        .frame(width: 24, height: 24)
                                }.padding(.vertical, 10.0)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10).fill(disruptorColor)
                                    )
                            }
                            
                        }
                    }
                }
            }.padding(.horizontal, paddingHorizontal)
            
        }
    }

}

struct AddMenu: View {
    @Binding var selectedTab: String
    var anchor: () -> AnyView

    init<LabelView: View>(selectedTab: Binding<String>, @ViewBuilder label: @escaping () -> LabelView) {
        self._selectedTab = selectedTab
        self.anchor = { AnyView(label()) }
    }
    
    var body: some View {
        Menu {
            Button(action: {
                // action code for adding a new plan
                selectedTab = "add-plan-form"
                print("Add New Plan")
            }) {
                Text("Add New Plan")
            }
            .padding()
            
            Button(action: {
                // action code for copying an existing plan
                print("Copy An Existing Plan")
            }) {
                Text("Copy An Existing Plan")
            }
        } label: {
            Button(action: {
                print("button tapped!")
            }) {
                anchor()
            }
        }
    }
}

#Preview {
    ContentView()
}
