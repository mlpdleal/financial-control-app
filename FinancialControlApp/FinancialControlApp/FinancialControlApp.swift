//
//  FinancialControlAppApp.swift
//  FinancialControlApp
//
//  Created by Manoel Leal on 10/04/22.
//

import SwiftUI

@main
struct FinancialControlAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
   
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)

        }
    }
}
