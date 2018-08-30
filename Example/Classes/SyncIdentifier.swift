//
//  SyncIdentifier.swift
//  Synchronizable_Tests
//
//  Created by Arman Galstyan Home on 8/20/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public protocol SyncIdentifierType: Equatable {
}

extension Int: SyncIdentifierType {}

extension Int8: SyncIdentifierType {}

extension Int16: SyncIdentifierType {}

extension Int32: SyncIdentifierType {}

extension Int64: SyncIdentifierType {}

extension UInt: SyncIdentifierType {}

extension UInt8 : SyncIdentifierType {}

extension UInt16: SyncIdentifierType {}

extension UInt32: SyncIdentifierType {}

extension UInt64: SyncIdentifierType {}

extension String: SyncIdentifierType {}

extension Double: SyncIdentifierType {}

extension Float: SyncIdentifierType {}

extension Array: SyncIdentifierType where Element: SyncIdentifierType {
    public static func ==<T: SyncIdentifierType>(_ lvl: Array<T>, _ rvl: Array<T>) -> Bool {
        return true
    }
}
