import SwiftUI

struct SearchIngredientsView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String? = nil
    @State private var isSearching = false

    let categories = [
        ("Fruits", "fruit", true),
        ("Vegetables", "carrot.fill", false),
        ("Meats", "hare", false),
        ("Bread", "bread", true),
        ("Seafood", "fish", false),
        ("Rice", "bowl", true)
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                TextField("Search ingredients...", text: $searchText, onCommit: {
                    guard !searchText.isEmpty else { return }
                    isSearching = true
                    selectedCategory = "All"
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                // Category list
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(categories, id: \.0) { category in
                            NavigationLink(
                                destination: category.0 == "Fruits"
                                    ? AnyView(FruitView())
                                    : AnyView(SearchResultsView(searchText: "", category: category.0)),
                                label: {
                                    CategoryBar(category: category)
                                }
                            )
                        }
                    }
                    .padding()
                }

                Spacer()

                // Hidden navigation link for search action
                NavigationLink(
                    destination: SearchResultsView(searchText: searchText, category: selectedCategory ?? "All"),
                    isActive: $isSearching,
                    label: { EmptyView() }
                )
            }
            .navigationTitle("Search Ingredients")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CategoryBar: View {
    var category: (String, String, Bool)

    var body: some View {
        HStack(spacing: 16) {
            Group {
                if category.2 {
                    Image(category.1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                } else {
                    Image(systemName: category.1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 30, alignment: .center) // Keeps icons aligned

            Text(category.0)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

#Preview {
    SearchIngredientsView()
}

