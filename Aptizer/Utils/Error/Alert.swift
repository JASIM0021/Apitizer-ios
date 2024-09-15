//
//  Alert.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Internal error | invalid data ."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("invalid response | internal server error."),
                                           dismissButton: .default(Text("OK")))
    static let invalidUrl = AlertItem(title: Text("URL Error"),
                                           message: Text("URL was not found."),
                                           dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                           message: Text("Unable to connect the server please check your internet connection"),
                                           dismissButton: .default(Text("OK")))
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                           message: Text("Please ensure all fields in the form have been field out."),
                                           dismissButton: .default(Text("OK")))
    static let invalidEmail  = AlertItem(title: Text("Invalid Email"),
                                           message: Text("Please ensure your email is correct"),
                                           dismissButton: .default(Text("OK")))
    static let savedSuccessUser  = AlertItem(title: Text("Saved Success"),
                                           message: Text("Your information saved successfully"),
                                           dismissButton: .default(Text("OK")))
    static let saveduserFails  = AlertItem(title: Text("faild to save"),
                                           message: Text("Your data saved failed please try again latter"),
                                           dismissButton: .default(Text("OK")))
}
