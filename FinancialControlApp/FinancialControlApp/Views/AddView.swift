//
//  addFinancialIssueView.swift
//  FinancialControlApp
//
//  Created by Manoel Leal on 11/04/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldDescription: String = ""
    @State var textFieldValue: String = ""
    @State var toogleIsIncome: Bool = true
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView{
            Section {
                TextField("Description: ", text: $textFieldDescription)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                    TextField("Value: ", text: $textFieldValue)
                    .keyboardType(.decimalPad)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                
                Toggle("Is Income?", isOn: $toogleIsIncome)
                    
                    
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                )
            } header: {
                Text("Issue Information")
            }
                .padding(14)
        }
            .navigationTitle("Add an Issue 💵")
            .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveButtonPressed(){
        if textIsApprorpiate(){
            var value = Double (textFieldValue.replacingOccurrences(of: ",", with: "."))!
            if !toogleIsIncome {
                value *= -1.0
            }
            listViewModel.addItem(description: textFieldDescription, value: value)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsApprorpiate() -> Bool{
        if  textFieldDescription.isEmpty || textFieldValue.isEmpty {
            alertTitle = "Some field on this screen was not filled 😰😨😱!!! Please, fill all fields in this screen!"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    

    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }

    
    
}





struct addFinancialIssueView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
 }

