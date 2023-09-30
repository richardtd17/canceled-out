//
//  ContentView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 9/29/23.
//

import SwiftUI

let name = "Richard"
let profileImage = "profile-image"

let paddingHorizontal:CGFloat = 10;

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hi, " + name);
                Spacer();
                Image(profileImage);
            }.padding(.horizontal, paddingHorizontal)
        }
    }
}

#Preview {
    ContentView()
}
