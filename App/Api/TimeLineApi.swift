//
//  TimeLineApi.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation

enum TimeLineApi: ApiType{
    
    case getHomeTimeline

    var method: HTTPMethod{
        .get
    }
    var path: String{
        switch self {
        case .getHomeTimeline:
            return "1.1/statuses/home_timeline.json"
        }
    }
    
//    var parameters: [String : Any]?
    
}
