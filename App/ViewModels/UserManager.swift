//
//  UserManager.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

 

class UserManager : ObservableObject{
    static let share = UserManager()
    let userDefaults : UserDefaults = UserDefaults.standard
    
    
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
}
