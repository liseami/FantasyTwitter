//
//  UserManager.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Swifter
import AuthenticationServices

class UserManager : NSObject, ObservableObject,ASWebAuthenticationPresentationContextProviding{
    
    static let share = UserManager()
    
    let userDefaults : UserDefaults = UserDefaults.standard
    
    let swifter = Swifter(consumerKey:  consumerKey, consumerSecret: consumerSecret)
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    func getToken(){
        swifter.authorize(withProvider: self, callbackURL: URL(string: "https://www.revome.com")!) { access_token, URLResponse in
            print(access_token)
        }
    }
    
    func getme(){
        let target = LoginApi.getMeinfo
        Networking.request(target) { result in
            if let id =
                result.json?.dictionaryObject?.first(where: { parameter in
                    parameter.key == "id"
                })?.value as? String{
                self.locuserID = id
                HomeViewModel.share.get_hoem_timeline()
            }
            if let name =
                result.json?.dictionaryObject?.first(where: { parameter in
                    parameter.key == "name"
                })?.value as? String{
                self.name = name
            }
            if let username =
                result.json?.dictionaryObject?.first(where: { parameter in
                    parameter.key == "username"
                })?.value as? String{
                self.username = username
            }
            
        }
    }
    //登录判断
    var logged : Bool{
        get{
            return  access_token != nil
        }
        set{
            objectWillChange.send()
            self.logged = newValue
        }
    }
    
    //V2
    //access_token
    var access_token : String?{
        get{
            return userDefaults.string(forKey: "access_token")
        }
        set{
            objectWillChange.send()
            userDefaults.setValue(newValue, forKey: "access_token")
        }
    }
    
    //V2
    //refresh_token
    var refresh_token : String?{
        get{
            return userDefaults.string(forKey: "refresh_token")
        }
        set{
            objectWillChange.send()
            userDefaults.setValue(newValue, forKey: "refresh_token")
        }
    }
    
    //V2
    //id
    var locuserID : String?{
        get{
            return userDefaults.string(forKey: "locuserID")
        }
        set{
            objectWillChange.send()
            userDefaults.setValue(newValue, forKey: "locuserID")
        }
    }
    
    //V2
    //name
    var name : String?{
        get{
            return userDefaults.string(forKey: "name")
        }
        set{
            objectWillChange.send()
            userDefaults.setValue(newValue, forKey: "name")
        }
    }
    
    //V2
    //username
    var username : String?{
        get{
            return userDefaults.string(forKey: "username")
        }
        set{
            objectWillChange.send()
            userDefaults.setValue(newValue, forKey: "username")
        }
    }
}
