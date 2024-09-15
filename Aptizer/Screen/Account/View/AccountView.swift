//
//  AccountView.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import SwiftUI

struct AccountView: View {
 
    
    @StateObject var viewModel = AccountViewModel()
    
    @FocusState private var focusTextFields : formTextFields?
    
    enum formTextFields {
        case firstName, lastName, email
    }
    var body: some View {
        
      
        NavigationView{
            
            Form {
              
                Section(header:Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextFields,equals: .firstName)
                        .onSubmit {focusTextFields = .lastName}
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextFields,equals: .lastName)
                        .onSubmit { focusTextFields = .email}
                        .submitLabel(.next)
                    
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextFields,equals: .email)
                        .onSubmit {focusTextFields = nil}
                        .submitLabel(.continue)
                    
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                    
//                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.birthday,
                        in: Date().oneHundredYear...Date().eightinYear,
                        displayedComponents: .date
                    )
                    
                    Button {
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                    
                }
                Section(header:Text("Requests")){
                    
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkin)
//                        .tint(Color(.brandPrimary))
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentlyReffile)
//                        .tint(Color(.brandPrimary))
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            
                .navigationTitle("🤣 Account")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard, content: {
                        Button("Dismiss"){
                            focusTextFields = nil
                        }
                    })
                }
            
        }
        .onAppear{
            viewModel.retriveUser()
        }
        .alert(item:$viewModel.alertItem) { item in
            
            Alert(title: item.title,message: item.message,dismissButton: item.dismissButton)
            
        }
        
    }
}

#Preview {
    AccountView()
}
