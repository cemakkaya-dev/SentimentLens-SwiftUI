//
//  SentimentViewModel.swift
//  SentimentLens
//
//  Created by Cem Akkaya on 25/03/26.
//

import SwiftUI

@Observable
class SentimentViewModel {
    
    var searchText = ""
    var isAnalyzing = false
    var filteredReviews: [Review] = []
    var reviews: [Review] = []
    var sentimentResult: SentimentResult?
    let csvParser = CSVParser()
    let sentimentAnalyzer = SentimentAnalyzer()
    
    func loadReviews() {
        reviews = csvParser.readCSVFile()
    }
    
    func analyze() {
        filteredReviews = reviews.filter { $0.text.lowercased().contains(searchText.lowercased()) }
        
        guard !filteredReviews.isEmpty else {
            sentimentResult = nil
            return
        }
        
        let stringReviews = filteredReviews.map { $0.text }
        let counts = sentimentAnalyzer.analyzeBatch(texts: stringReviews)
        
        let total = Double(filteredReviews.count)
        var positiveRatio = (Double(counts.positive) / total) * 100
        var negativeRatio = (Double(counts.negative) / total) * 100
        var neutralRatio = (Double(counts.neutral) / total) * 100
        
        let dominant: SentimentResult.Sentiment
        
        if positiveRatio > 38.33 {
            dominant = .positive
        } else if negativeRatio > 38.33 {
            dominant = .negative
        } else if neutralRatio > 38.33 {
            dominant = .neutral
        } else {
            dominant = .mixed
        }
        
        sentimentResult = SentimentResult(
            query: searchText,
            totalReviewNumber: filteredReviews.count,
            positive: counts.positive,
            negative: counts.negative,
            neutral: counts.neutral,
            dominantEmotion:  dominant
            )
        
        
    }
    
}
