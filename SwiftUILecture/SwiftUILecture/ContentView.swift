//
//  ContentView.swift
//  SwiftUILecture
//
//  Created by user256704 on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//struct ContentView: View {
//    @State private var textValue: String = ""
// 
//    var body: some View {
//        VStack {
//            TextField("Enter text", text: $textValue)
//            Text(textValue)
//        }
//    }
//}

#Preview {
    ContentView()
}
