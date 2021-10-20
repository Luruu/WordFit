//
//  ContentView.swift
//  WordFit
//
//  Created by Renato on 20/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("logo")
                .frame(width: 116.0, height: 116.0)
            Text("Word Fit")
            Text("Wordhhh Fit")
            ContentView2()
        }
    }
}

struct ContentView2: View {
    var body: some View {
        Text("it's a trail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
