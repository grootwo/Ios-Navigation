//
//  ContentView.swift
//  Navigation
//
//  Created by Groo on 6/15/24.
//

import SwiftUI

struct NavigationView: View {
    var num: Int
    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Going to random NavigationView", value: Int.random(in: 0...1000))
            .navigationTitle("number \(num)")
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            NavigationView(num: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    NavigationView(num: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
