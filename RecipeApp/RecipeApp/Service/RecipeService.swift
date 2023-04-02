//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Berkat Bhatti on 4/2/23.
//

import Foundation
import Combine

struct RecipeService {
    
    static func getRecipefor(query: String) -> AnyPublisher<RecipeIncridents, Error>  {
        let recipeRequestHeader = getRequestHeader(query: query)
        return URLSession.DataTaskPublisher(request: recipeRequestHeader, session: .shared)
            .map({$0.data})
            .decode(type: RecipeIncridents.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private static func getRequestHeader(query: String) -> URLRequest {
        let headers = [
            "X-RapidAPI-Key": "de1d2e9a71msh0f600e66c3e9995p176880jsnac05f5686a41",
            "X-RapidAPI-Host": "yummly2.p.rapidapi.com"
        ]

        var request = URLRequest(url: NSURL(string: "https://yummly2.p.rapidapi.com/feeds/auto-complete?q=\(query)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
