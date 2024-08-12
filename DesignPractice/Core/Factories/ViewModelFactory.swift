//
//  ViewModelFactory.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 10/08/2024.
//

import Foundation

final class ViewModelFactory {
    
    func makeDesignsViewmodel() -> DesignsViewModel {
        return DesignsViewModel(designs: designList)
    }
}
