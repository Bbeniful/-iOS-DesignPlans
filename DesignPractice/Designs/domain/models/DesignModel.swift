//
//  DesignModel.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 10/08/2024.
//

import Foundation


protocol Model: Identifiable where ID == String? {
    var id: Self.ID { get set }
}

struct DesignModel: Model {
    var id: String?
    var name: String
    var page: Page?
    
    
    
    init(id: String? = "\(UUID())", name: String, page: Page? = nil) {
        self.id = id
        self.name = name
        self.page = page
    }
}




let designList: [DesignModel] = [
    DesignModel(name: "Buttons", page: .Buttons),
    DesignModel(name: "ColorPicker", page: .ColorPicker)
]
