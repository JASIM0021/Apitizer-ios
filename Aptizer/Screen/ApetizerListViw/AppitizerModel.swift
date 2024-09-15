//
//  AppitizerModel.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import Foundation

struct ApitizerResponse: Codable {
    let request: [Apitizer]
}

// MARK: - Request
struct Apitizer: Codable , Identifiable {
    let protein, id: Int?
    let imageURL: String?
    let carbs: Int?
    let name: String?
    let price: Double?
    let description: String?
    let calories: Int?
}


struct MocData {
    static let sampleApitizer  = Apitizer(protein: 8081, id: 1, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", carbs: 0, name: "Asian Flank Steak", price: 8.99, description: "This perfectly thin cut just melts in your mouth.", calories: 300)
    
    static let apizerSampledata = [sampleApitizer,sampleApitizer,sampleApitizer,sampleApitizer]
}
