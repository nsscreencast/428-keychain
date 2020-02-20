//
//  Valet+app.swift
//  KeychainDemo
//
//  Created by Ben Scheirman on 2/18/20.
//  Copyright © 2020 NSScreencast. All rights reserved.
//

import Valet

extension Valet {
    static var app: Valet {
        return .valet(with: Identifier(nonEmpty: "com.nsscreencast.keychainDemo")!,
                      accessibility: .whenUnlocked)
    }
}
