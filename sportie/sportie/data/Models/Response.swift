//
//  Result.swift
//  Day5
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

struct Response<T: Codable>{
    var data: T?
    var message: String?
    var status: ResponseStatus?
}

enum ResponseStatus{
    case success, failure
}
