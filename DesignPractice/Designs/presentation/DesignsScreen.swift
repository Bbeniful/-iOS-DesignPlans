//
//  DesignsScreen.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 10/08/2024.
//

import SwiftUI

struct DesignsScreen: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    var viewModel: DesignsViewModel
    
    
    init(viewModel: DesignsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.designs) { item in
            DesignListItem(designModel: item) { page in
                if let navPath = page {
                    coordinator.push(page: navPath)
                }
            }
        }.listStyle(.plain)
    }
    
}

struct DesignListItem: View {
    
    var designModel: DesignModel
    var onClick: (Page?) -> Void
    
    var body: some View {
        Text(designModel.name)
            .onTapGesture {
                onClick(designModel.page)
            }
    }
}
