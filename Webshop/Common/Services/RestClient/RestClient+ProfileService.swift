//
//  RestClient+ProfileService.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation

protocol ProfileService: class {
    func createProfile(data: User, completion: @escaping  ProfileLoaded)
    func getProfile(profileId: Int, completion: @escaping  ProfileLoaded)
    func getProfileByEmail(email: String, completion: @escaping  ProfileLoaded)
    func updateProfile(data: User, completion: @escaping  ProfileLoaded)
}

extension RestClient: ProfileService {
    func updateProfile(data: User, completion: @escaping ProfileLoaded) {
        if let id = data.id {
            let url = "\(Constants.baseURL)/customers/\(id)"
            
            let profileData = ProfileData()
            profileData.name = data.name
            profileData.email = data.email
            profileData.phoneNumber = data.phoneNumber
            profileData.postNumber = data.postNumber
            profileData.city = data.city
            profileData.address = data.address
            
            request(url: url, method: .put, data: profileData.dictionary ) { (result: Result<ProfileResponse, Error>) in
                completion(result)
            }
        }
    }
    
    func getProfileByEmail(email: String, completion: @escaping ProfileLoaded) {
        let url = "\(Constants.baseURL)/customers/email"
        request(url: url, method: .post, data: ["email":email] ) { (result: Result<ProfileResponse, Error>) in
            completion(result)
        }
    }
    
    func getProfile(profileId: Int, completion: @escaping ProfileLoaded) {
        let url = "\(Constants.baseURL)/customers/\(profileId)"
        request(url: url, method: .get, data: nil ) { (result: Result<ProfileResponse, Error>) in
            completion(result)
        }
    }
    
    func createProfile(data: User, completion: @escaping ProfileLoaded) {
        let url = "\(Constants.baseURL)/customers/"
        request(url: url, method: .post, data: data.dictionary ?? [:] ) { (result: Result<ProfileResponse, Error>) in
            completion(result)
        }
    }
    
}



