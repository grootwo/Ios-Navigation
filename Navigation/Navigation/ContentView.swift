//
//  ContentView.swift
//  Navigation
//
//  Created by Groo on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {  
        NavigationStack {
            List(1..<100) { i in
                NavigationLink("\(i)") {
                    Text("\(i) view")
                }
            }
            .navigationTitle("Navigation Title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.indigo, for: .navigationBar)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
