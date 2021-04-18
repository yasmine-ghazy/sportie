//
//  Movie.swift
//  Day2
//
//  Created by Yasmine Ghazy on 31/03/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String!
    var image: String!
    var releaseYear: Int!
    var rating: Double!
    var genre: [String]!
    var isFav: Bool? = false
    
    init() {}
    
    init(title:  String ,
    image: String,
    releaseYear: Int,
    rating: Double,
    genre: String,
    isFav: Bool = false) {
        self.title = title
        self.image = image
        self.releaseYear = releaseYear
        self.rating = rating
        self.genre = [genre]
        self.isFav = isFav
    }

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        //genre = dictionary["genre"] as? String
        image = dictionary["image"] as? String
        rating = dictionary["rating"] as? Double
        releaseYear = dictionary["releaseYear"] as? Int
        title = dictionary["title"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
//        if genre != nil{
//            dictionary["genre"] = genre
//        }
        if image != nil{
            dictionary["image"] = image
        }
        if rating != nil{
            dictionary["rating"] = rating
        }
        if releaseYear != nil{
            dictionary["releaseYear"] = releaseYear
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }
}
