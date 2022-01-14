//
//  ContentView.swift
//  AnxietyApp
//
//  Created by Finn Seyffer on 1/9/22.
//

import SwiftUI

// Background color and images for button icons defined
let MainColor = UIColor(red: 200, green: 255, blue: 200)
let items = Array(1...4).map({ "image\($0)"})

// Sets structure of LazyVGrid display
let layout = [
    GridItem(.flexible(minimum: 100)),
    GridItem(.flexible(minimum: 100))
]

// Texts and links for buttons initialized in list
let websites = [
    "https://www.xhalr.com",
    "https://www.youtube.com",
    "https://accounts.spotify.com/en/login/?continue=https:%2F%2Fopen.spotify.com%2F__noul__%3Fl2l%3D1%26nd%3D1&_locale=en-US",
    "https://www.pleaselive.org/hotlines/"
    
]

let commands = [
    "Breathe", "Distraction", "Music", "Help"
]

// ContentView and the body of the view
struct ContentView: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        // Scroll view to access more than length of screen
        ScrollView(.vertical) {
            Text("Take it Slow :)")
                .font(.system(size: 50, design: .monospaced))
                .padding()
            // Two column grid of icons
            LazyVGrid(columns: layout) {
                ForEach((0...3), id: \.self) { i in
                    // Buttons given a scaled icon and a subtitle
                    Button(action: {
                        openURL(URL(string: websites[i])!)
                    }, label: {
                        VStack {
                            Image(items[i])
                                .resizable()
                                .frame(maxWidth: 300, maxHeight: 300)
                            Text(commands[i])
                                .font(.system(size: 18, design: .monospaced))
                                .foregroundColor(Color.black)
                        }
                    })
                    // Button asthetics
                    .aspectRatio(contentMode: .fit)
                    .border(Color(MainColor))
                    .padding()
                }
            }
            Spacer(minLength: 5)
            // Bottom text within ScrollView
            Text("Promise me you'll always remember:\nyou're braver than you believe, and stronger than you seem, and stronger than you think.")
                .font(.system(size: 29, design: .serif))
                .padding()
            Text("-Christopher Robin from Winnie the Pooh")
                .font(.system(size: 25, design: .serif))
                .padding()
            
        }
        .background(Color(MainColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
