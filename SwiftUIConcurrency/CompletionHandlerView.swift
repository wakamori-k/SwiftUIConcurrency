//
//  CompletionHandlerView.swift
//  SwiftUIConcurrency
//
//  Created by 若森和昌 on 2022/02/10.
//

import SwiftUI

struct CompletionHandlerView: View {
    @StateObject var viewModel = CompletionHandlerViewModel()
    
    var body: some View {
        Text(viewModel.designPhilosophy)
            .onAppear {
                viewModel.fetch()
            }
    }
}

/// ViewModel with completion handler
final class CompletionHandlerViewModel: ObservableObject {
    @Published private(set) var designPhilosophy = ""
    private let model = Model()
    
    func fetch() {
        model.fetchDesignPhilosophy { string in
            // Dispatch back to the main thread to update state
            DispatchQueue.main.async {
                self.designPhilosophy = string ?? ""
            }
        }
    }
}
