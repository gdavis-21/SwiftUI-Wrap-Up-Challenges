//
//  Book.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import Foundation

struct Book: Identifiable, Decodable {
    
    var title: String
    var author: String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    var id: Int
    var content: [String]
}
