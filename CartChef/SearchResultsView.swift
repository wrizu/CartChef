import SwiftUI

struct SearchResultsView: View {
    let searchText: String
    let category: String

    var body: some View {
        VStack {
            Text("Results for \"\(searchText)\" in \(category)")
                .font(.largeTitle)
                .padding()

            // Placeholder for actual search results
            Spacer()
            Text("Search results go here")
                .foregroundColor(.gray)
            Spacer()
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchResultsView(searchText: "Apple", category: "Fruits")
}
