//
//  Post.swift
//  Reddit
//
//  Created by Kvng Eko on 11/29/22.
//

import Foundation

struct TopLevelObject {
    let data: SecondLevelObject
}


struct SecondLevelObject {
    let children: [ThirdLevelObject]
}

struct ThirdLevelObject {
    let data: Post
}


struct Post {
    let title: String
    let ups: Int
    let thumbnail: String
}
