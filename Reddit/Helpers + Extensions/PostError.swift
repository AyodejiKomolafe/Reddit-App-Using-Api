//
//  PostError.swift
//  Reddit
//
//  Created by Kvng Eko on 11/29/22.
//

import Foundation

enum PostError: LocalizedError {
    case invalidURL
    
    var errorDescription: String? {
        switch self {
            
        case .invalidURL:
            return "The server failed to reach the necessary URL."
        }
    }
}
