//
//  LoginApi.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation
import FantasyUI
import CryptoKit




enum LoginApi : ApiType{
    case getAccessToken(p:getAccessTokenReqMod)
    case getMeinfo
    case getMeTweets

    
    var path: String{
        switch self {
        case .getAccessToken:
            return "2/oauth2/token"
        case .getMeinfo:
            return "2/users/me"
        case .getMeTweets:
            return "2/users/:\(913314383526223872)/tweets"
        }
    }
    
    var method: HTTPRequestMethod{
        switch self {
        case .getAccessToken:
            return .post
        case .getMeinfo:
            return .get
        case .getMeTweets:
            return .get
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .getAccessToken(let p):
            return p.kj.JSONObject()
        case .getMeinfo:
            return nil
        case .getMeTweets:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding{
        return URLEncoding.default
    }


}


struct getAccessTokenReqMod : Convertible{
    var code : String?
    var grant_type : String = "authorization_code"
    var client_id : String = APP_ClientID
    var redirect_uri : String = "https://www.revome.com"
    var code_verifier : String = "challenge"
}

struct request_tokenReqMod : Convertible{
    var oauth_callback : String = #"https://www.revome.com"#
}


func makeHttpHeader_V2(){
    let BearerTokencredentials = consumerKey + ":" + consumerSecret
    let Base64_encoded_Bearer_Token = BearerTokencredentials.toBase64()
    
}


















func makeHttpHeader(for method: HTTPMethod,url:URL,parameters:[String:Any])->String{
    
    //授权参数
    var authorizationParameters = [String : Any]()
    //版本
    authorizationParameters["oauth_version"] = "1.0"
    //请求方法
    authorizationParameters["oauth_signature_method"] =  "HMAC-SHA1"
    //消费者密钥
    authorizationParameters["oauth_consumer_key"] = consumerKey
    //时间戳
    authorizationParameters["oauth_timestamp"] = String(Int(Date().timeIntervalSince1970))
    //随机数
    authorizationParameters["oauth_nonce"] = UUID().uuidString
    
    //将参数中key带有“oauth_”的参数加入授权参数
    for (key,value) in parameters where key.hasPrefix("oauth_"){
        authorizationParameters.updateValue(value, forKey: key)
    }
    
    let combinedParameters = authorizationParameters +| parameters
    
    let finalParameters = combinedParameters
    
    authorizationParameters["oauth_signature"] = oauthSignature(for: method, url: url, parameters: finalParameters, accessToken: nil)
    
    let authorizationParameterComponents = authorizationParameters.urlEncodedQueryString(using: .utf8).components(separatedBy: "&").sorted()
    
    var headerComponents = [String]()
    
    for component in authorizationParameterComponents {
        let subcomponent = component.components(separatedBy:  "=")
        if subcomponent.count == 2{
            headerComponents.append("\(subcomponent[0])=\"\(subcomponent[1])\"")
        }
    }
    
    return "OAuth" + " " + headerComponents.joined(separator: ",")
}

func oauthSignature(for method: HTTPMethod, url: URL, parameters: [String: Any], accessToken token: String?) -> String{
    
    let encodedConsumerSecret = consumerSecret.urlEncodedString()
    let signingKey = "\(encodedConsumerSecret)&"
    let parameterComponents = parameters.urlEncodedQueryString(using: .utf8).components(separatedBy: "&").sorted()
    let parameterString = parameterComponents.joined(separator: "&")
    let encodedParameterString = parameterString.urlEncodedString()
    let encodedURL = url.absoluteString.urlEncodedString()
    let signatureBaseString = "\(method.rawValue)&\(encodedURL)&\(encodedParameterString)"
    let key = signingKey.data(using: .utf8)!
    let message = signatureBaseString.data(using: .utf8)!
    let sha1 = HMAC.sha1(key: key, message: message)!
    return sha1.base64EncodedString(options: [])
}
