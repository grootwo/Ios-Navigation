//
//  ContentView.swift
//  Navigation
//
//  Created by Groo on 6/15/24.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct NavigationView: View {
    var num: Int
    var body: some View {
        NavigationLink("Going to random NavigationView", value: Int.random(in: 0...1000))
            .navigationTitle("number \(num)")
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            NavigationView(num: 0)
                .navigationDestination(for: Int.self) { i in
                    NavigationView(num: i)
                }
        }
    }
}

#Preview {
    ContentView()
}
