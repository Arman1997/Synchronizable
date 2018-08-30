//
//  SynchronizableObject.swift
//  Synchronizable_Tests
//
//  Created by Arman Galstyan on 8/20/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public protocol SyncIdentifiable: Equatable {
    associatedtype IdentifierType: SyncIdentifierType
    var syncId: IdentifierType { get }
}

public protocol SyncableObject: SyncIdentifiable {
    associatedtype SyncingObjectType: SyncingObject where Self.IdentifierType == SyncingObjectType.IdentifierType
    func sync(from syncObject: SyncingObjectType)
}

public protocol SyncingObject: SyncIdentifiable {
}

extension SyncIdentifiable {
    public static func ==(_ lvl: Self, _ rvl: Self) -> Bool {
        return lvl.syncId == rvl.syncId
    }
}

extension Array: SyncIdentifiable where Element: SyncIdentifiable {
    public typealias IdentifierType = [Array.Element.IdentifierType]
    
    public var syncId: [Array.Element.IdentifierType] {
        return self.map({ $0.syncId })
    }
}

extension Array: SyncingObject where Element: SyncingObject {
}

extension Array: SyncableObject where Element: SyncableObject {
    public typealias SyncingObjectType = [Element.SyncingObjectType]
    
    public func sync(from syncObject: [Element.SyncingObjectType]) {
        
    }
    
}
