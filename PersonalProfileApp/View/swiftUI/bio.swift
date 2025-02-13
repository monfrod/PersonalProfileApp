//
//  bio.swift
//  PersonalProfileApp
//
//  Created by yunus on 09.02.2025.
//
import SwiftUI

struct EmailCardView: View {
    var email: String = "maqsam1155@gmail.com"
    var onTapped: () -> Void = {}

    var body: some View {
        Button(action: {
            onTapped()
        }) {
            HStack {
                // Логотип письма
                Image(systemName: "envelope.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.2))
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.white.opacity(0.3), radius: 5, x: -5, y: -5)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                Spacer()

                Image(systemName: "arrow.up.right.square")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
            )
        }
        .buttonStyle(PlainButtonStyle()) // Убираем стандартный эффект кнопки
    }
}

struct ContentView: View {
    var body: some View {
        HStack{
            EmailCardView {
                print("Email card tapped")
            }
        }
    }
}

#Preview{
    ContentView()
}
