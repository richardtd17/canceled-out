//
//  HeaderView.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 9/29/23.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var name: String
    @Binding var profileImage: String

    var body: some View {
        HStack {
            HStack {
                Text("Hi, " + name).font(.system(.title)).foregroundColor(disruptorColor);
                Spacer();
                CircularIcon(imageName: profileImage, width: 40, height: 40)
            }.padding(.horizontal, paddingHorizontal)
            
        }
            
    }
}

#Preview {
    ContentView()
}
