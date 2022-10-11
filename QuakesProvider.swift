//
//  QuakesProvider.swift
//  Earthquakes-iOS
//
//  Created by Elijah on 10/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@MainActor class QuakesProvider: ObservableObject {

    @Published var quakes: [Quake] = []

    let client: QuakeClient

    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }

    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }

    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
