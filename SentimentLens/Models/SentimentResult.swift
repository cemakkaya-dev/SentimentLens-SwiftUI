//
//  SentimentResult.swift
//  SentimentLens
//
//  Created by Cem Akkaya on 25/03/26.
//

import Foundation

struct SentimentResult {
    
    let query: String
    let totalReviewNumber: Int
    let positive: Int
    let negative: Int
    let neutral: Int
    let dominantEmotion: Sentiment
    
    enum Sentiment {
        case positive
        case negative
        case neutral
        case mixed
    }
    
}
