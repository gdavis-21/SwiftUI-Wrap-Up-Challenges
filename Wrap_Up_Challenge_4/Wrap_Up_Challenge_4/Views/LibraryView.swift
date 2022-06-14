//
// LibraryView.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var model: LibraryViewModel
    
    @State var star = ""
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                ScrollView() {
                    ForEach(model.books) { book in
                        NavigationLink(destination: {
                            BookView(book: book)
                        }, label: {
                            ZStack(alignment: .topLeading) {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text(book.title)
                                            .font(.title)
                                            .bold()
                                        Spacer()
                                        Image(systemName: book.isFavourite ? "star.fill" : "")
                                            .foregroundColor(.yellow)
                                    }
                                    Text(book.author)
                                        .font(.title2)
                                        .italic()

                                    Image("cover\(book.id)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                .padding()
                            }
                            .frame(width: 350, height: 600)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 10)
                            .padding(.bottom, 20)
                        })
                        .foregroundColor(.black)
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("My Library"))
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(LibraryViewModel())
    }
}
