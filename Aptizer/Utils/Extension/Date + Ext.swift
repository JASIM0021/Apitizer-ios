//
//  Date + Ext.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 11/09/24.
//

import Foundation

extension Date {
    
    var eightinYear : Date {
        
        return Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    var oneHundredYear : Date {
        
        return Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}
