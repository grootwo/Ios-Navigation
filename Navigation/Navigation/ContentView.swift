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
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("go to 10") {
                    path = [10]
                }
                Button("go to 100") {
                    path.append(100)
                }
                Button("go to 30 and 10, 100") {
                    path = [30, 10, 100]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("This is \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
