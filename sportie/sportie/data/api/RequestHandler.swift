//
//  RequestHandler.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation
import Alamofire

typealias ResponseHandler<T: Codable> = (Response<T>) -> ()

class RequestHandler {
    
    static let shared = RequestHandler()
    private init(){}
    
    func get<T: Codable>(url: String, parameters: [String: String]? = nil, completion: @escaping ResponseHandler<T>){

        AF.request(url, method: .get).responseDecodable(of:T.self) { response in
            switch response.result {
                   case .success:
                       switch response.response?.statusCode {
                       case 200:
                           //response.value
                        print("\n******************************")
                        print("Request url: \(url)")
                        print("******************************")
                        print(response.value!)
                        print("******************************\n")
                        completion(Response(data: response.value, message: "success", status: .success))
                       default:
                           //handle other cases
                        completion(Response(data: nil, message: "failure", status: .failure))
                       }
                   case let .failure(error):
                       //probably the decoding failed because your json doesn't match the expected format
                    completion(Response(data: nil, message: error.localizedDescription, status: .failure))
            }
        }
    }
}
