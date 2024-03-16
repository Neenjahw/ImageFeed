//
//  Constants.swift
//  ImageFeed
//
//  Created by Pavel Popov on 06.03.2024.
//

import Foundation

//MARK: - Constants
enum Constants {
    static let accessKey: String = "TB24G6Lt590QhZWzFU0dV0RZrFhGsI-004MZZ5-rvt4"
    static let secretKey: String = "ZHwCNQUCdq0gT3PG_IO61UHO0wE3KPJ0wIFMALHxZyQ"
    static let redirectURI: String = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope: String = "public+read_user+write_likes"
    static let authPath: String = "oauth/token/"
    static let defaultBaseURL = URL(string: "https://unsplash.com/")
    static let apiURL = URL(string: "https://api.unsplash.com/")
}
