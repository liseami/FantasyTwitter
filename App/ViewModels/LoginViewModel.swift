//
//  LoginViewModel.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import AuthenticationServices

class LoginViewModel :NSObject, ObservableObject{

    
    let user = UserManager.share
    var challengeCode : String = ""
    
    static let share = LoginViewModel()

    @Published var loginURL : String?
    
    // TwitterV2
    //---------------------------------------
    @Published var code_of_APP_Redirecturl : String?{
        //  获取到重定向中的code
        didSet{
            guard code_of_APP_Redirecturl!.count > 7 else {return}
        //  用Code请求token
        // MARK:  Step2
            self.getTwitterV2token()
        }
    }
    
    
    //TwitterV2token
    func getTwitterV2token(){
        let target = LoginApi.getAccessToken(p: .init(code: code_of_APP_Redirecturl))
        Networking.request(target) { result in
            var access_token = ""
            var refresh_token = ""
            var user_id = ""
            
            if let a =
                result.json?.dictionaryObject?.first(where: { parameter in
                    parameter.key == "access_token"
                })?.value as? String{
                access_token = a
            }
            if let r =
                result.json?.dictionaryObject?.first(where: { parameter in
                    parameter.key == "refresh_token"
                })?.value as? String {
                refresh_token = r
            }
            
            print("🐑🐑🐑🐑🐑🐑🐑🐑🐑🐑🐑" + access_token + "🐑🐑🐑🐑🐑🐑🐑🐑🐑🐑🐑" + refresh_token )
            
            guard !access_token.isEmpty && !refresh_token.isEmpty else {madaError();return}
            
            //                  MARK:  Step3
            UserManager.share.access_token = access_token
            UserManager.share.refresh_token = refresh_token
        }
    }
}
