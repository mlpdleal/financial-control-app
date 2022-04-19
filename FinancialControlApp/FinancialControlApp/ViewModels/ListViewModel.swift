//
//  ListViewModel.swift
//  FinancialControlApp
//
//  Created by Manoel Leal on 11/04/22.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject{
    
    // Everytime the var items is called, didSet execute the function saveItems for persist the data in userDefauls(cache)
    @Published var items: [FinancialIssueModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    // this is the cache key for store data in userData
    let itemsKey: String = "financial_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([FinancialIssueModel].self, from: data)
        else { return }
        
        self.items = savedItems
    
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        
    }
    
    func addItem(description: String, value: Double){
        let newItem = FinancialIssueModel(description: description, value: value)
        items.append(newItem)

    }
    
    // Function that saves data in UserDefaults (cache)
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func addItemsValues() -> Double{
        
       
        var total: Double = 0.0
        
        for item in 0..<self.items.count {
            total += self.items[item].value
        }
        
        return total
    }
    
}
