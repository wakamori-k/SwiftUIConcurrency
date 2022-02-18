//
//  ContentView.swift
//  SwiftUIConcurrency
//
//  Created by 若森和昌 on 2022/02/10.
//

import SwiftUI

struct ConcurrencyView: View {
    @StateObject var viewModel = ConcurrencyViewViewModel()
    
    var body: some View {
        Text(viewModel.designPhilosophy)
            .task { // Use task (not onAppear) for async methods
                await viewModel.fetch()
            }
    }
}

/// ViewModel with Concurrency
final class ConcurrencyViewViewModel: ObservableObject {
    @Published private(set) var designPhilosophy = ""
    private let model = Model()
    
    // @MainActor will guarantee that properties & methods are only ever accessed from MainActor
    @MainActor
    func fetch() async {
        // "await" yield the MainActor back to SwiftUI.
        // When "async" completes, Swift reenters the method back on the MainActor.
        self.designPhilosophy = await model.fetchDesignPhilosophy() ?? ""
    }
}
