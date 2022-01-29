//
//  LoginApi.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation

enum LoginApi : ApiType{
    case getAccessToken(p:getAccessTokenReqMod)
    
    var path: String{
        switch self {
        case .getAccessToken:
            return "2/oauth2/token"
        }
    }
    var method: HTTPMethod{
        .post
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .getAccessToken(let p):
            return p.kj.JSONObject()
        }
    }
    
}

struct getAccessTokenReqMod : Convertible{
    var code : String?
    var grant_type : String = "authorization_code"
    var client_id : String = APP_ClientID
    var redirect_uri : String = "https://www.revome.com"
    var code_verifier : String = "challenge"
}
