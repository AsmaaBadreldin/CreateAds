//
//  ContentView.swift
//  Free Ads
//
//  Created by asmaa badreldin on 25/11/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        StoryBoardView().ignoresSafeArea()
    }
}

struct StoryBoardView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainVC")
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

//#Preview {
//    ContentView()
//}
