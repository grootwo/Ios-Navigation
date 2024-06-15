//
//  ContentView.swift
//  Navigation
//
//  Created by Groo on 6/15/24.
//

import SwiftUI

struct NavigationView: View {
    let number: Int
    var body: some View {
        Text("\(number) NavigationView")
    }
    init(number: Int) {
        self.number = number
        print("\(number) NavigationView created")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(1..<51) { num in
                NavigationLink("\(num) NavigationView") {
                    NavigationView(number: num)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
