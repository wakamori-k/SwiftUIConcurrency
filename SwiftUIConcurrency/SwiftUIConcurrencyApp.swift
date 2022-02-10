//
//  SwiftUIConcurrencyApp.swift
//  SwiftUIConcurrency
//
//  Created by 若森和昌 on 2022/02/10.
//

import SwiftUI

@main
struct SwiftUIConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                CompletionHandlerView()
                ConcurrencyView()
            }
        }
    }
}
