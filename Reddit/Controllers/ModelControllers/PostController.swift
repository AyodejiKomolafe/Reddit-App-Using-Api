//
//  PostController.swift
//  Reddit
//
//  Created by Kvng Eko on 11/29/22.
//

import Foundation

class PostController {
    
    static let baseUrl = URL(string: "https://www.reddit.com")
    static let rComponent = "r"
    
    static let jsonExtension = "json"
    
    static func fetchPostsWith(searchTerm: String, completion: @escaping (Result<[Post], PostError>) -> Void){
        
        
        guard let baseUrl = baseUrl else {return completion(.failure(.invalidURL))}
        
        
        
        
        
        
        
        
    }
    
    
}
