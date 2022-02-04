//
//  ApiCenter.swift
//  Cashmix
//
//  Created by 赵翔宇 on 2021/12/18.
//


import Foundation
import UIKit
import Moya


protocol ApiType: CustomTargetType {
    
}

extension ApiType {
    
    var scheme: String { ProjectConfig.scheme }
    var host: String { ProjectConfig.host }
    var port: Int? { ProjectConfig.port }
    var firstPath: String? { ProjectConfig.firstPath }
    
    
    var headers: [String: String]? {
        if let token = UserManager.share.access_token{
            
            return ["Authorization":"Bearer " + token]
        }else{
            return nil
        }
    }
    
    
    
    
    
}

struct ProjectConfig {
    static let env: Environment = .test
    
    enum Environment {
        case test, mok
    }
    
    static var scheme: String { "https" }
    
    static var host: String {
        switch env {
        case .test: return "api.twitter.com"
        case .mok: return "api.weibo.com/2"
        }
    }
    
    static var port: Int? {
        return nil
    }
    
    static var firstPath: String? {
        switch env {
        case .test: return ""
        case .mok: return ""
        }
    }
    
}




