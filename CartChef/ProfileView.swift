import SwiftUI

struct ProfileView: View {
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
                Text("Account")
                    .font(.largeTitle)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)

                // Navigation Rows
                Group {
                    NavigationLink(destination: Text("Order History View")) {
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.gray)
                                .frame(width: 24)
                            Text("Order History")
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }

                    NavigationLink(destination: Text("Saved Recipes View")) {
                        HStack {
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(.gray)
                                .frame(width: 24)
                            Text("Saved Recipes")
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                }

                Spacer()

                // Log In button
                Button(action: {
                    print("Log In tapped")
                }) {
                    Text("Log In")
                        .font(.title3)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Sign Up button
                Button(action: {
                    print("Sign Up tapped")
                }) {
                    Text("Sign Up")
                        .font(.title3)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding([.horizontal, .bottom])
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
