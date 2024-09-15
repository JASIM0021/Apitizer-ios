//
//  RemoteImage.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 05/09/24.
//

import Foundation

import SwiftUI

final class ImageLoader : ObservableObject {
    
    @Published var image : Image? = nil
    
    func load(urlString:String){
        
        NetworkManager.shared.downloadImage(urlString: urlString) { uiimage in
            
            guard let image = uiimage else {return}
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
           
        }
    }
}

struct RemoteImage:View {
    
    var image:Image?
    
    var body: some View {
        image?.resizable() ?? Image(.foodPlaceholder).resizable()
    }
}

struct ApetizerRemoteImage : View {
    
    @StateObject var imageloader = ImageLoader()
    
    let urlString : String
    
    var body: some View {
        
        RemoteImage(image: imageloader.image)
            .onAppear{
                imageloader.load(urlString: urlString)
            }
    }
}
