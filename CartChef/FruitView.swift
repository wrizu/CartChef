import SwiftUI

struct FruitView: View {
    let fruits: [(name: String, imageName: String)] = [
        ("Banana", "banana"),
        ("Watermelon", "watermelon"),
        ("Strawberries", "strawberries"),
        ("Apples", "apples"),
        ("Grapes", "grapes"),
        ("Pineapple", "pineapple"),
        ("Oranges", "oranges"),
        ("Blueberries", "blueberries"),
        ("Mangoes", "mangoes"),
        ("Peaches", "peaches")
        
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // Cart Icon Top-Right
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
                Text("Browse Fruits")
                    .font(.largeTitle) // Match HomeView and SearchIngredientsView
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)

                // Fruit Rows
                ForEach(fruits, id: \.name) { fruit in
                    HStack(spacing: 16) {
                        Image(fruit.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(8)

                        Text(fruit.name)
                            .font(.title3)
                            .foregroundColor(.primary)

                        Spacer()

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

                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FruitView()
}
