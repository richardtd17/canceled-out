//
//  ContentView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 9/29/23.
//

import SwiftUI
import UIKit

let paddingHorizontal:CGFloat = 20;
let standardSpacing: CGFloat = 24

let userArray1 = [User(name: "Jack", profileImage: "jack-image")]
let userArray2 = [
    User(name: "Richard", profileImage: "richard-image"),
    User(name: "Crystal", profileImage: "crystal-image")
]
let userArray3 = [
    User(name: "Richard", profileImage: "richard-image"),
    User(name: "Crystal", profileImage: "crystal-image"),
    User(name: "Jack", profileImage: "jack-image")
]

let plansArray = [
    Plan(name: "Hiking Trip", date: Date(), description: "A hiking trip to the nearby hills.", isCanceled: false, friends: []),
    Plan(name: "Movie Night", date: Date(), description: "A cozy movie night with friends.", isCanceled: false, friends: userArray2),
    Plan(name: "Book Club Meeting", date: Date(), description: "Discussing the latest book we've read.", isCanceled: false, friends: userArray3)
]

struct ContentView: View {
    @State var name = "Richard"
    @State var profileImage = "festival-portrait"
    @State var selectedTab = "home"
    @State var cancelledOutPlan: Plan? = nil
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
    }
    
    func changeTab(tabName: String) {
        self.selectedTab = tabName;
    }

    var body: some View {
        ZStack {
            // Main Content
            VStack {
                Button("Cancel a Plan") {
                    let plan = Plan(name: "Sample Plan", date: Date(), description: "Sample Plan")
                   
                    withAnimation(.easeInOut(duration: 0.75)){
                        cancelledOutPlan = plan
                    }
               }
                
                HeaderView(name: $name, profileImage: $profileImage)
                
                TabView (selection: $selectedTab) {
                    HomeView(selectedTab: $selectedTab)
                        .background(GradientBackground())
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                        .tag("home")
                    
                    AddPlanFormView()
                        .background(GradientBackground())
                        .tabItem {
                            Image(systemName: "plus.circle.fill")
                        }
                        .tag("add-plan-form")
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                        }
                        .tag("settings")
                }
            }
                .background(lightAccentColor)
                .zIndex(1)

            
            // Cancelled Plan overlay
            if cancelledOutPlan != nil {
                CancelledOutView(plan: $cancelledOutPlan)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: AnyTransition.opacity,
                            removal: AnyTransition.move(edge: .trailing)
                        )
                    )
                    .zIndex(2)
            }
        }

    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

struct AddIcon: View {
    
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.all, 8.0)
            .frame(width: 36, height: 36)
            .foregroundStyle(primaryColor)
            .background(disruptorColor)
            .clipShape(Circle())
    }
}

struct CircularIcon: View {
    var imageName: String
    var width: CGFloat;
    var height: CGFloat;
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(disruptorColor, lineWidth: 1)
            )
    }
}

struct SystemCircularIcon: View {
    var imageName: String
    var width: CGFloat;
    var height: CGFloat;
    var padding: CGFloat;
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.all, padding)
            .frame(width: width, height: height)
            .foregroundStyle(disruptorColor)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(disruptorColor, lineWidth: 1)
            )
    }
}

#Preview {
    ContentView()
}

