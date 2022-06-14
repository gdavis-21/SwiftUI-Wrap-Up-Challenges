//
//  PageView.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import SwiftUI

struct PageView: View {
    
    @EnvironmentObject var model: LibraryViewModel
    
    @State var book: Book
    @State var page = 0
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(0..<book.content.count, id: \.self) { index in
                VStack {
                    Text(book.content[index])
                    Spacer()
                    Text(String(index + 1))
                }
                .padding()
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let book = Book(title: "Aladan", author: "John Smith", isFavourite: true, currentPage: 0, rating: 2, id: 1, content: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu congue lacus, ac laoreet felis. Integer eros tortor, blandit id magna non, pharetra sodales urna. Donec egestas sed leo eu gravida. Quisque condimentum iaculis sem quis venenatis. Duis consectetur blandit elit porttitor tincidunt. Praesent mi libero, pulvinar ac nibh vitae, euismod feugiat elit. Sed elementum libero odio.\n\nVestibulum efficitur urna ac risus suscipit ullamcorper. Vestibulum et aliquet erat. Ut lobortis pretium nulla, a porta ipsum accumsan ut. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec at ullamcorper purus, sed ultricies mauris. Morbi facilisis sollicitudin purus in commodo. Cras maximus id mauris non pulvinar. Maecenas vitae pharetra leo. Pellentesque dolor ligula, ullamcorper sed ultricies eget, sollicitudin sit amet sapien. Vivamus in neque id nunc rutrum mattis at vitae velit. Sed vel vestibulum massa. Quisque sollicitudin sem ac massa interdum dignissim. Etiam metus ligula, facilisis at posuere et, mattis ut quam. Morbi urna arcu, egestas ut imperdiet et, molestie eget dolor. Vestibulum cursus, erat ac vestibulum congue, dolor felis iaculis lectus, vel pellentesque mauris arcu nec justo.", "World", "This", "Is", "A", "Test"])
        
        PageView(book: book)
            .environmentObject(LibraryViewModel())
    }
}
