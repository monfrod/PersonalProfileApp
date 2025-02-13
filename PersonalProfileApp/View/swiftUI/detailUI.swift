//
//  detailUI.swift
//  PersonalProfileApp
//
//  Created by yunus on 14.02.2025.
//
import SwiftUI
import AVKit

struct DetailView: View {
    
    let title: String
    let videoName: String
    let videoFormat: String
    let description: String
    
    var body: some View {
        let path = Bundle.main.path(forResource: self.videoName, ofType: self.videoFormat) ?? ""
        NavigationStack{
            ScrollView{
                VStack{
                    VideoPlayer(player: AVPlayer(url: URL(fileURLWithPath: path)))
                        .frame(width: 293, height: 650)
                    Text(description)
                        .fontWeight(.regular)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 20)
                }
            }
            .navigationTitle(title)
        }
    }
}
