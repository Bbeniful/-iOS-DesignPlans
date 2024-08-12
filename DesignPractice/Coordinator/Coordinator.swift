//
//  Coordinator.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 10/08/2024.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    private let viewModelFactory = ViewModelFactory()
    
    func push(page: Page) {
        path.append(page)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        ViewFactory.createView(for: page, with: viewModelFactory)
    }
}
