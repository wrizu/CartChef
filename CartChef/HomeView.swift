import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to CartChef!")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    print("Top profile button tapped")
                }) {
                    Image(systemName: "person.circle")
                        .imageScale(.large)
                }
            )
        }
    }
}
#Preview {
    HomeView()
}

