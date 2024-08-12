//
//  CoordinatorView.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 10/08/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .Designs)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }.environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
