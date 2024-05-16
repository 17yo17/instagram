//
//  Models.swift
//  Instagram
//
//  Created by 垰野亮 on 5/16/24.
//

import Foundation

enum Gender{
    case male, female, other
}

struct User{
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}
struct UserCount{
    let followers: Int
    let following: Int
    let post: Int
}

public enum UserPostType {
    case photo, video
}

////  Represents a user post
public struct UserPost{
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL  //either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

struct PostLike{
    let username: String
    let postIdentifier: String
}
struct CommentLike{
    let username: String
    let commentIdentifier: String
}
struct PostComment{
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
