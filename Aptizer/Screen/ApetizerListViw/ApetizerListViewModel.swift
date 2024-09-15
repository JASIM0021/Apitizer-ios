//
//  ApetizerListViewModel.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import Foundation


@MainActor final class ApitegerListVewViewModel : ObservableObject {
  
    @Published var  listItem : [Apitizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published  var isShowDetails = false
    @Published  var selectedItem : Apitizer?
   
//    func getItem(){
//        isLoading = true
//        NetworkManager.shared.getAppTizers {[weak self] result  in
//            
//            self?.isLoading = false
//            switch(result){
//               
//            case .success(let data):
//                self?.listItem = data
//            case .failure(let error):
//                print("error",error.localizedDescription)
//                switch error {
//                    
//                case .invalidData:
//                    self?.alertItem = AlertContext.invalidData
//                case .invalidResponse:
//                    self?.alertItem = AlertContext.invalidResponse
//                case .invalidURL:
//                    self?.alertItem = AlertContext.invalidUrl
//                case .unableToComplete:
//                    self?.alertItem = AlertContext.unableToComplete
//                    
//                    
//                }
//            }
//        }
        
      
//    }
    
    func getItem(){
        isLoading = true

        
        Task {
            
            do {
                
                listItem = try await NetworkManager.shared.getAppTizers()
                isLoading = false
            } catch {
                
                if let apError = error as? APError {
                    switch apError {
              
                              case .invalidData:
                                  alertItem = AlertContext.invalidData
                              case .invalidResponse:
                                  alertItem = AlertContext.invalidResponse
                              case .invalidURL:
                                  alertItem = AlertContext.invalidUrl
                              case .unableToComplete:
                                  alertItem = AlertContext.unableToComplete
              
              
                              }
                    
                }else {
                    
                    // MARK: Generic error
                    alertItem = AlertContext.invalidResponse
                }
    
                isLoading = false
            }
        }
      
    }
}
