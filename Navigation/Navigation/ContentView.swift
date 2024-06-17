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
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(1..<6) { i in
                    NavigationLink("number: \(i)", value: i)
                }
                ForEach(1..<6) { i in
                    NavigationLink("string: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("string \(selection)")
            }
            .toolbar {
                Button("Push path 200") {
                    path.append(200)
                }
                Button("Push path 50") {
                    path.append(50)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
