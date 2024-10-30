//
//  RecipeView.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import SwiftUI
import Kingfisher
import os

struct SectionHeaderView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.name).font(.headline).bold()
                .accessibilityHeading(.h1)
                .accessibilityAddTraits(.isHeader)
            Text(recipe.cuisine ?? "").font(.subheadline)
                .accessibilityHeading(.h2)
        }
    }
}

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        Group {
            VStack {
                Section(header: SectionHeaderView(recipe: recipe)) {
                    ZStack {
                        KFImage(recipe.photoLarge).scaledToFill()
                            .accessibilityLabel("Food Item")
                        VStack {
                            if recipe.ytURL != nil {
                                ZStack {
                                    Image(systemName: "play.rectangle").foregroundStyle(Color(.white))
                                        .imageScale(.large)
                                        .dynamicTypeSize(.xxxLarge)
                                        .font(.system(size: 40, weight: .heavy))
                                        .padding(.leading, 275)
                                        .padding(.top, 400)
                                        .foregroundStyle(.red)
                                        .backgroundStyle(.red)
                                        .onTapGesture {
                                            UIApplication.shared.open(recipe.ytURL!)
                                        }
                                        .accessibilityLabel("Video Link")
                                        .accessibilityHint("Tap to exit the app and navigate to a video platform")
                                        .accessibilityAddTraits(.isButton)
                                }
                            }
                            if recipe.sourceURL != nil {
                                Image(systemName: "link.circle.fill").foregroundStyle(Color(.white))
                                    .imageScale(.large)
                                    .dynamicTypeSize(.xxxLarge)
                                    .font(.system(size: 40, weight: .heavy))
                                    .padding(.leading, 275)
                                    .padding(.top, 20)
                                    //.frame(width: 100, height: 100)
                                    .onTapGesture {
                                        UIApplication.shared.open(recipe.sourceURL!)
                                    }
                                    .accessibilityLabel("Source Article Link")
                                    .accessibilityHint("Tap to exit the app and navigate to the recipe website")
                                    .accessibilityAddTraits(.isButton)
                            }
                        }
                    }
                    
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
