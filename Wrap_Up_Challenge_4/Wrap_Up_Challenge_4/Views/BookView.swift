//
//  BookView.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import SwiftUI

struct BookView: View {
    
    @EnvironmentObject var model: LibraryViewModel
    
    var book: Book
    @State var isFavourite: Bool = false
    @State var star = "star"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(spacing: 20) {
                Text("Read Now!")
                    .font(.title2)
                NavigationLink(destination: {
                    PageView(book: book)
                }, label: {
                    Image("cover\(book.id)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })
                VStack {
                    Text("Mark for later!")
                        .font(.title3)
                        .bold()
                        .padding()
                    Image(systemName: star)
                        .foregroundColor(.yellow)
                        .font(.title3)
                        .onTapGesture {
                            if isFavourite {
                                // The star was tapped while favorited
                                star = "star"
                                isFavourite = false
                                model.books[book.id - 1].isFavourite = false
                            }
                            else {
                                // The star was tapped while not favorited
                                star = "star.fill"
                                isFavourite = true
                                model.books[book.id - 1].isFavourite = true
                            }
                        }
                }
                .padding()

                Text("Rate \(book.title)")
                    .font(.title3)
                    .bold()
                Picker(selection: $model.books[book.id].rating, content: {
                    Text("1")
                        .tag(1)
                    Text("2")
                        .tag(2)
                    Text("3")
                        .tag(3)
                    Text("4")
                        .tag(4)
                    Text("5")
                        .tag(5)
                }, label: {
                    Text("")
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading,.trailing])
                Spacer()
            }
            .padding(.top)
        }
        .padding()
        .padding(.bottom, 30)
        .navigationBarTitle(book.title, displayMode: .automatic)
        .onAppear(perform: {
            if model.books[book.id - 1].isFavourite {
                star = "star.fill"
            }
            else {
                star = "star"
            }
        })
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        
        let book = Book(title: "Aladan", author: "John Smith", isFavourite: true, currentPage: 0, rating: 2, id: 1, content: ["Hello", "World"])
        
        BookView(book: book)
            .environmentObject(LibraryViewModel())
    }
}
