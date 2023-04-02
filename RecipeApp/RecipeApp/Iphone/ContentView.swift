//
//  ContentView.swift
//  RecipeApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var recipeVM = IncridentsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipeVM.incridents, id: \.self) { incrident in
                    Text(incrident)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
