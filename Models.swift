//
//  Models.swift
//  Instagram
//
//  Created by Ivan on 10.02.2022.
//

import Foundation

enum Gender {
    case male, female, other
}



struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let profilePhoto: URL
    let birhDate: Date
    let gender: Gender
    let counts: UserCounts
    let joinDate: Date
}

struct UserCounts {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType {
    case photo,video
}

/// Represents a user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

struct PostLike {
    let username: String
    let postIdentifier: String
    
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
    
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes:[CommentLike]
}


