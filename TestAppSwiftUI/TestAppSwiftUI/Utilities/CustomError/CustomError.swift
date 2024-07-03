//
//  CustomError.swift
//  TestApp
//
//  Created by NeoSOFT on 27/06/24.
//

import Foundation

// MARK: Custom Error
struct CustomError: LocalizedError {
    let message: String // msg // New commit 
    init(_ message: String) {
        self.message = message
    }
    var errorDescription: String? {
        message
    }
}
