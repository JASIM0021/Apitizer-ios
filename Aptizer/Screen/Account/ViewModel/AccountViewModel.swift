//
//  AccountViewModel.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 09/09/24.
//

import Foundation
import SwiftUI
final class AccountViewModel : ObservableObject {
    
    @AppStorage("user") private var userData : Data?
    @Published var user = User()
    @Published var alertItem : AlertItem?
    
    var isValid : Bool {
        
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false}
        return true
    }
    
    func saveChanges(){
        guard isValid else {return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.savedSuccessUser
        }catch {
            
            alertItem = AlertContext.saveduserFails
        }
    }
    
    func retriveUser(){
        
        
         guard let userData = userData else { return }
        
        do {
             user = try JSONDecoder().decode(User.self, from: userData)
           
        }catch {
            
            alertItem = AlertContext.saveduserFails
        }
        
    }
    
    
}
