//
//  Critical.swift
//  Created on 1/18/21
//

import Foundation

func criticalCast<T>(_ object: Any) -> T {
    guard let successfulCast = object as? T else {
        fatalError("Failed to cast \(object) to \(T.self)")
    }
    return successfulCast
}
