//
//  LoginViewModel.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//





class LoginViewModel : ObservableObject {
    
    static let share = LoginViewModel()
    @Published var loginURL : String?
    
    @Published var code_of_APP_Redirecturl : String?{
        //        获取到重定向中的code
        didSet{
            guard code_of_APP_Redirecturl!.count > 7 else {return}
            self.getLoginURL()
        }
    }
    
    func getLoginURL(){
        let target = LoginApi.getAccessToken(p: .init(code: code_of_APP_Redirecturl))
        Networking.request(target) { result in
            var access_token = ""
            var refresh_token = ""
            
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
            
            UserManager.share.access_token = access_token
            UserManager.share.refresh_token = refresh_token
            
        }
    }
}
