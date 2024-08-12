//
//  ViewFactory.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 12/08/2024.
//

import Foundation
import SwiftUI

class ViewFactory {
    
    @ViewBuilder
       static func createView(for page: Page, with viewModelFactory: ViewModelFactory) -> some View {
           switch page {
           case .Designs:
               DesignsScreen(viewModel: viewModelFactory.makeDesignsViewmodel())
           case .Buttons:
               ButtonsScreen()
           case .ColorPicker:
               ColorChangeScreen()
           }
       }
}
