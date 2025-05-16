import SwiftUI

struct BrowseRecipesView: View {
    @State private var searchText: String = ""
    
    let recipeCategories = [
        ("Italian", "italian"),
        ("Mexican", "mexican"),
        ("Japanese", "japanese"),
        ("Indian", "indian"),
        ("Thai", "thai"),
        ("Chinese", "chinese"),
        ("French", "french"),
        ("Mediterranean", "mediterranean"),
        ("American", "american"),
        ("Korean", "korean")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Cart icon top-right
                HStack {
                    Spacer()
                    Button(action: {
                        print("Cart tapped")
                    }) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing)
                }

                // Title
                Text("Browse Recipes")
                    .font(.largeTitle)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)

                // Search bar
                TextField("Search recipes...", text: $searchText)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // Scrollable recipe categories
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(recipeCategories.filter { searchText.isEmpty || $0.0.localizedCaseInsensitiveContains(searchText) }, id: \.0) { category, imageName in
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 60)
                                    .clipped()
                                    .cornerRadius(8)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BrowseRecipesView()
}
