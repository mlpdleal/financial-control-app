//
//  ListRowView.swift
//  FinancialControlApp
//
//  Created by Manoel Leal on 11/04/22.
//

import SwiftUI

struct ListRowView: View {
    
    let financialIssue: FinancialIssueModel
    
    var body: some View {
        
        if financialIssue.value > 0 {
            HStack{
                Text(financialIssue.description)
                Spacer()
                Text("\(financialIssue.value, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
            }
                .foregroundColor(Color("PositiveTextColor"))
                .padding(15.0)
                .frame(maxWidth: .infinity)
                .font(.caption)
        } else {
            HStack{
                Text(financialIssue.description)
                Spacer()
                Text("\(financialIssue.value, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
            }
                .foregroundColor(Color("NegativeTextColor"))
                .padding(15.0)
                .frame(maxWidth: .infinity)
                .font(.caption)
        }
        
    }
}

struct HeaderListRowView: View{
    
    var body: some View {
        HStack{
            Text("Description")
            Spacer()
            Text("Value")
                .padding(.trailing)
        }
            .padding(15.0)
            .frame(maxWidth: .infinity)
            .font(.caption)
        
    }
    
}

struct TotalListRowView: View{
    
    @Binding var total: Double
    
    var body: some View {
        
        if total > 0{
            HStack{
                Text("Total: ")
                Spacer()
                Text("\(total, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
            }
            .foregroundColor(Color("PositiveTextColor"))
            .padding(15.0)
            .frame(maxWidth: .infinity)
        } else {
            HStack{
                Text("Total: ")
                Spacer()
                Text("$ \(total, specifier: "%.2f")")
            }
            .foregroundColor(Color("NegativeTextColor"))
            .padding(15.0)
            .frame(maxWidth: .infinity)
        }

        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = FinancialIssueModel(description: "Salary", value: 25.00)
    static var item2 = FinancialIssueModel(description: "food", value: -35.00)
    static var total = Binding.constant(50.00)
    
    static var previews: some View {
        VStack{
            HeaderListRowView()
            ListRowView(financialIssue: item1)
            ListRowView(financialIssue: item2)
            TotalListRowView(total: total)
        }
    }
}
