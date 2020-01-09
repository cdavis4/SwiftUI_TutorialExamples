//
//  ContentView.swift
//  WebKit
//
//  Created by Carrie Davis on 1/9/20.
//  Copyright © 2020 Carrie Davis. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var returnurl = URLRequest(url: URL(string:"https://restaurantsmwp.netlify.com")!)
    var body: some View {
        NavigationView {
            VStack {
                WebView(request: returnurl)
            }.navigationBarTitle(Text("WebPage"))
        }
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
