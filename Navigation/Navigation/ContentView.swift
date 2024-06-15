//
//  ContentView.swift
//  Navigation
//
//  Created by Groo on 6/15/24.
//

import SwiftUI

struct Person: Hashable {
    var id = UUID()
    var name: String
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(1..<51) { num in
                NavigationLink("\(num)", value: num)
                    .navigationDestination(for: Int.self, destination: { selection in
                        Text("You selected \(selection)")
                    })
                    .navigationDestination(for: Person.self, destination: { person in
                        Text("You selected \(person)")
                    })
            }
        }
    }
}

#Preview {
    ContentView()
}
