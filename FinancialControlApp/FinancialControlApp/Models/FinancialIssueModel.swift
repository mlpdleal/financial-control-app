//
//  FinancialIssue.swift
//  FinancialControlApp
//
//  Created by Manoel Leal on 11/04/22.
//

import Foundation

struct FinancialIssueModel: Identifiable, Codable {
    
    let id: String
    let description: String
    let value: Double
    let dateIssue: Date
    
    init(id: String = UUID().uuidString, description: String, value: Double){
        self.id = id
        self.description = description
        self.value = value
        self.dateIssue = Date.now
    }
    
}
