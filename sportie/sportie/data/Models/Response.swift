//
//  Result.swift
//  Day5
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation



struct Response{
    var data: Any?
    var message: String?
    var status: ResponseStatus?
    var statusCode: Int?
}


enum ResponseStatus{
    case Success, Failure
}
