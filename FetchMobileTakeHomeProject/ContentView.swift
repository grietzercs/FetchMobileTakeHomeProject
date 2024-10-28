//
//  ContentView.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/24/24.
//

import SwiftUI
import os
import Kingfisher

struct ContentView: View {
    @State var mainViewModel = MainViewModel()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        
        VStack {
            ForEach(mainViewModel.recipeList, id:\.self) { recipe in
                Group {
                    KFImage(recipe.photoLarge)
                    VStack {
                        Text(recipe.name).font(.headline).bold()
                            .accessibilityHeading(.h1)
                            .accessibilityAddTraits(.isHeader)
                        Text(recipe.type).font(.subheadline)
                            .accessibilityLabel("recipeType")
                    }
                }
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onChange(of: scenePhase, initial: true) { phase, _  in
            if phase != .active { return }
            Task {
                do {
                    try await mainViewModel.retrieveData()
                    Logger().info("Recipe List: \(mainViewModel.recipeList)")
                } catch {
                    Logger().error("Ran into error attempting to grab data on scene phase change")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
