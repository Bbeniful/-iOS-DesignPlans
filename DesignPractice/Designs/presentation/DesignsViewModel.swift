//
//  DesignsViewModel.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 10/08/2024.
//

import Foundation
import Observation
import Combine

@Observable
class DesignsViewModel {
    
    var designs: [DesignModel] = []
    
    init(designs: [DesignModel]) {
        self.designs = designs
    }
    
}
