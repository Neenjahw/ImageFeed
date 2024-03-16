//
//  OAuthTokenResponseBody.swift
//  ImageFeed
//
//  Created by Pavel Popov on 12.03.2024.
//

import Foundation

// MARK: - OAuthTokenResponseBody
struct OAuthTokenResponseBody: Codable {
    let accessToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}

