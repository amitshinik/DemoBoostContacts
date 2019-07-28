//
//  ContactModel.swift
//  DemoBoostContact
//
//  Created by Amit Gupta on 28/07/2019.
//  Copyright © 2019 Amit Gupta. All rights reserved.
//

import Foundation

struct Contact : Decodable {
    var id: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
}
