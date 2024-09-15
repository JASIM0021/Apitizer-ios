//
//  AppitizerListview.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import SwiftUI

struct AppitizerListview: View {
 
    @StateObject var viewModel = ApitegerListVewViewModel()
    
   
    var body: some View {
        
       
        
        ZStack{
            NavigationView {
                List(viewModel.listItem, id: \.id){ item in
                    
                    ApetizerListCell(item: item)
                      
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.isShowDetails = true
                            viewModel.selectedItem = item
                        }
                    
                }
                .listStyle(.insetGrouped)
                
                .navigationTitle("🍟 Apitizer")
            }
            .disabled(viewModel.isShowDetails)
            .blur(radius: viewModel.isShowDetails ? 10 : 0)
            if viewModel.isShowDetails {
                ApetizerDetailsView(item: viewModel.selectedItem ?? MocData.sampleApitizer, isShow: $viewModel.isShowDetails)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
//        .onAppear{
//            viewModel.getItem()
//        }
        .task {
            viewModel.getItem()
        }
        .alert(item: $viewModel.alertItem){alert in
            
            Alert(title: alert.title,message: alert.message,dismissButton: alert.dismissButton)
            
        }
    }
    
    
}

#Preview {
    AppitizerListview()
}
