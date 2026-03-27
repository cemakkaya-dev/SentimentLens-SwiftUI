//
//  CSVParser.swift
//  SentimentLens
//
//  Created by Cem Akkaya on 25/03/26.
//

import Foundation

struct CSVParser {
    
    func readCSVFile() -> [Review] {
        var parsedReviews: [Review] = []
        
        guard let fileURL = Bundle.main.url(forResource: "socialMediaReviews", withExtension: "csv") else {
            print("An error occurred while creating fileURL.")
            return []
        }
        
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            
            let reviews = content
                .components(separatedBy: "\n")
                .dropFirst()
                .filter {!$0.isEmpty}
            
            for review in reviews {
                if review.hasPrefix("\"") {
                    if let index = review.range(of: "\",") {
                        let text = String(review[review.startIndex ..< index.lowerBound].dropFirst())
                        let label = String(review[index.upperBound...]).trimmingCharacters(in: .whitespaces)
                        
                        if label == "positive" || label == "negative" || label == "neutral" {
                            let newReview = Review(text: text, label: label)
                            parsedReviews.append(newReview)
                        }
                    }
                    
                } else {
                    
                    if let index = review.lastIndex(of: ",") {
                        let text = String(review[review.startIndex ..< index])
                        let label = String(review[review.index(after: index) ..< review.endIndex]).trimmingCharacters(in: .whitespaces)
                        
                        if label == "positive" || label == "negative" || label == "neutral" {
                            let newReview = Review(text: text, label: label)
                            parsedReviews.append(newReview)
                        }
                        
                        
                        
                    } else {
                        continue
                    }
                }
            }
            
        } catch {
            print("The file could not be read: \(error)")
            return []
        }
        
        return parsedReviews
    }
}
