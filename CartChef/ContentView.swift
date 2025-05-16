import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }

            SearchIngredientsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            BrowseRecipesView()
                .tabItem {
                    Image(systemName: "book.fill")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
        }
    }
}
