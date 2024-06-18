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
            Text("This is Text")
                .toolbar {
                    ToolbarItemGroup(placement: .confirmationAction) {
                        Button("Confirm Button") {}
                        Button("Confirm Button") {}
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
