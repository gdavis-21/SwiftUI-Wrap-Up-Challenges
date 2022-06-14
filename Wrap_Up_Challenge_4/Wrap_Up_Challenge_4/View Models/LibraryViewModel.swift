//
//  LibraryViewModel.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import Foundation

class LibraryViewModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        books = DataServices.decodeJSON()
    }
}
