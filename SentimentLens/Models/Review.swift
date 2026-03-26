//
//  Review.swift
//  SentimentLens
//
//  Created by Cem Akkaya on 25/03/26.
//

import Foundation

struct Review: Identifiable {
    
    let id = UUID()
    let text: String
    let label: String
    
}
