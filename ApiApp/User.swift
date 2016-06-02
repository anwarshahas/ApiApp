//
//  User.swift
//  ApiApp
//
//  Created by Shahas on 02/06/16.
//  Copyright © 2016 shahas. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class User: Mappable {
    
    var id: Int!
    var name: String!
    var email: String!
    var password: String!
    
    
    class func fetchUser() {
  
        let URL = "https://where-you-belong.herokuapp.com/users"
        Alamofire.request(.GET, URL).responseArray(keyPath: "users") { (response: Response<[User], NSError>) in
            
            let usersArray = response.result.value
            if let users = usersArray {
                for user in users {
                    print(String(user.id) + " " + user.name)
                    print("   " + user.email)
                }
            }
        }
 
    }
    
    init(){}
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        password <- map["password"]
    }
    

}
