//
//  Model.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import Foundation

// MARK: - SerchPhotos
struct PhotosSearch: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}
