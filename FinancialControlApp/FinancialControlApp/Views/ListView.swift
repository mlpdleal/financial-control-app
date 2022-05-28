//
//  ContentView.swift
//  FinancialControlApp
//
//  Created by Manoel Leal on 10/04/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    
    var body: some View {
        
        
            ZStack{
                List{
                    Section{
                        ForEach(listViewModel.items) { item in
                            ListRowView(financialIssue: item)
                            
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        TotalListRowView(total: Binding.constant(listViewModel.addItemsValues()))
                    } header: {
                        HeaderListRowView()
                    }
                    
                }
                .listStyle(PlainListStyle())
            }.navigationTitle("My Finances 💰")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink("Add", destination: AddView()))
           
        
                
        
                
    }
    

}


    

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}
