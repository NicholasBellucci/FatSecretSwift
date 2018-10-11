//
//  FatSecretError.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import Foundation

public struct FSError: Codable {
    let code: Int
    let message: String?
}
