//
//  TestAppSwiftUIApp.swift
//  TestAppSwiftUI
//
//  Created by NeoSOFT on 27/06/24.
//

import SwiftUI

@main
struct TestAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView()
                .environment(\.colorScheme, .light)
        }
    }
}
