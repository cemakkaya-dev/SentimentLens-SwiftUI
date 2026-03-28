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

        VStack {
            Text(emojiText)
                .font(.system(size: 120))
            
            if let result = viewModel.sentimentResult {
                Text("\(result.totalReviewNumber) reviews analyzed")
                Text("Overall sentiment: \(result.dominantEmotion.rawValue)")
            }
            
            TextField("Search @mention or #hashtag...", text: $viewModel.searchText)
        }
        .onAppear {
            viewModel.loadReviews()
        }
        .onChange(of: viewModel.searchText) { oldValue, newValue in
            viewModel.analyze()
        }
    }
}

#Preview {
    ContentView()
}
