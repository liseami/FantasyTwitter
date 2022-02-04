//
//  TimeLineApi.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation


enum TimeLineApi: ApiType{
    
    case getLocUserTweets

    var method: HTTPRequestMethod{
        .get
    }
    var path: String{
        switch self {
        case .getLocUserTweets:
            return "2/users/\(913314383526223872)/tweets"
        }
    }
    
}
