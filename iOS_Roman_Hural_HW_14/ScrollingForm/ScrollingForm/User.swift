//
//  User.swift
//  ScrollingForm
//
//  Created by Roman Hural on 11.02.2022.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let addressLine1: String
    let addressLine2: String
    let city: String
    let state: String
    let zipCode: String
    let phoneNumber: String
    
    var description: String {
        return "User's full name \(firstName) \(lastName). \(firstName) \(lastName) lives by the address \(addressLine1) \(addressLine2) in the \(city) in \(state) state. \(city) zip code: \(zipCode). \(firstName) \(lastName)'s phone number: \(phoneNumber). "
    }
}
