//
//  IngridentsViewModel.swift
//  RecipeApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import Foundation
import Combine


class IncridentsViewModel: ObservableObject {
    @Published var incridents = [String]()
    private var cancellables = Set<AnyCancellable>()

    @Published var query: String = "chicken"
    
    
    init() {
        $query.flatMap { queryValue in
            RecipeService.getRecipefor(query: queryValue)
                .replaceError(with: RecipeIncridents(ingredients: []))
        }
        .map({$0.ingredients})
        .assign(to: &$incridents)
    }
}
