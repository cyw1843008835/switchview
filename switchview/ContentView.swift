//
//  ContentView.swift
//  switchview
//
//  Created by yw c on 2020/02/03.
//  Copyright © 2020 yw c. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
       
       var body: some View {
           NavigationView {
               NavigationLink(destination: SecondView(isFirstViewActive: $isActive), isActive: $isActive) {
                   Button(action: {
                       self.isActive = true
                   }, label: {
                       Text("Forward to Second View.")
                   })
               }
               .navigationBarTitle("First View")
           }
       }
}
struct SecondView: View {
    
    @State private var isActive = false
    @Binding var isFirstViewActive: Bool
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ThirdView(isFirstViewActive: $isFirstViewActive), isActive: $isActive) {
                Button(action: {
                    self.isActive = true
                }, label: {
                    Text("Forward to Third View.")
                })
            }
            .navigationBarTitle("Second View")
        }
    }
}
struct ThirdView: View {
    
    @Binding var isFirstViewActive: Bool
    
    var body: some View {
        Button(action: {
            self.isFirstViewActive = false
        }, label: {
            Text("Back to First View.")
        })
        .navigationBarTitle("Third View")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
