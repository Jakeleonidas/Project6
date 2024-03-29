//
//  User.swift
//  BeReal.
//
//  Created by Jorge Marquez on 2/25/24.
//

import Foundation
import ParseSwift

struct User: ParseUser {

    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?
    
    var lastPostedDate: Date?

}
// https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/3%20-%20User%20-%20Sign%20Up.xcplaygroundpage/Contents.swift#L16
