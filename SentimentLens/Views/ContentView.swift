//
//  ContentView.swift
//  SentimentLens
//
//  Created by Cem Akkaya on 25/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = SentimentViewModel()
    
    var emojiText: String {
        let emoji = viewModel.sentimentResult?.dominantEmotion
        
        switch emoji {
        case nil:
            return "❓"
        case .positive:
            return "😊"
        case .negative:
            return "😢"
        case .neutral:
            return "😐"
        default:
            return "🤔"
        }
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                colors: [Color(red: 7.0, green: 0.4, blue: 0.2),
                         Color(red: 0.0, green: 0.15, blue: 0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text(emojiText)
                        .font(.system(size: 120))
                        .contentTransition(.symbolEffect(.replace))
                        .animation(.easeInOut(duration: 0.5), value: emojiText)
                    
                    
                    if let result = viewModel.sentimentResult {
                        Text("\(result.totalReviewNumber) reviews analyzed")
                        Text("Overall sentiment: \(result.dominantEmotion.rawValue)")
                    } else {
                        Text("Type a @mention or #hashtag to analyze sentiment")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                }
                .padding(30)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black.opacity(0.7))
                        TextField("Search @mention or #hashtag...", text: $viewModel.searchText)
                    }
                }
                .padding(15)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .onAppear {
                viewModel.loadReviews()
            }
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                viewModel.analyze()
            }
        }
    }
}

#Preview {
    ContentView()
}
