//
//  SentimentAnalyzer.swift
//  SentimentLens
//
//  Created by Cem Akkaya on 25/03/26.
//

import Foundation
import CoreML

struct SentimentAnalyzer {
    
    let model: socialMediaClassifierModel? = try? socialMediaClassifierModel(configuration: .init())
    
    func predict(text: String) -> String {
        guard let prediction = try? model?.prediction(text: text) else {
            return "Unknown"
        }
        
        return prediction.label
    }
    
    func analyzeBatch(texts: [String]) -> (positive: Int, negative: Int, neutral: Int) {
        var counts: (positive: Int , negative: Int , neutral: Int ) = (positive: 0 , negative: 0 , neutral: 0 )
        
        for text in texts {
            let emotion = predict(text: text)
            switch emotion {
            case "positive":
                counts.positive += 1
            case "negative":
                counts.negative += 1
            case "neutral":
                counts.neutral += 1
            default:
                print("Unknown")
            }
        }
        
        return counts
    }
}
