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
    @StateObject var mainViewModel = MainViewModel(networkClient: NetworkClient())
    @Environment(\.scenePhase) private var scenePhase
//    @State var isDragging = false
//    var drag: some Gesture {
//        DragGesture()
//            .onChanged({ _ in
//                isDragging = true
//            })
//            .onEnded { _ in
//                Task {
//                    await mainViewModel.getData()
//                    isDragging = false
//                }
//                
//            }
//    }
    @State var displayProgressView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(mainViewModel.getList(), id:\.self) { recipe in
                            RecipeView(recipe: recipe)
                        }
                    }.background(Color.gray.opacity(0.35))
                }
                .navigationTitle("Recipe List")
                .toolbar {
                    Button {
                        displayProgressView = true
                        Task {
                            await mainViewModel.refreshList()
                            displayProgressView = false
                        }
                    } label: {
                        Label("Refresh List", systemImage: "arrow.clockwise")
                    }
                }
                .task {
                    await mainViewModel.getData()
                }
                if displayProgressView {
                    SpinnerView()
                }
            }
        }.alert("Recipe List Not Found", isPresented: $mainViewModel.isListEmpty,
            actions: {},
            message: {
                Text("Please restart the app with non-malformed data")
            }
        )
    }
}

#Preview {
    ContentView()
}
