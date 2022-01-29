//
//  LoginView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/7.
//






struct LoginView: View {
    
    @State private var step : Int = 0
    @StateObject var vm = LoginViewModel.share
    var body: some View {
        
        
        ZStack{
            VStack{
                
                Link(destination: URL(string: "https://twitter.com/liseami1")!) {
                 Text("最新进展")
                }
                .mFont(style: .Title_17_B,color: .MainColor)
                .frame(maxWidth:.infinity,alignment: .trailing)
                
                Spacer()
                Text("专业用户的Twitter客户端。帮助专业用户扩大营收 💸💸💸 ")
                    .mFont(style: .largeTitle_24_B,color: .fc1)
                    .ifshow(step == 0, animation: .spring(), transition: .move(edge: .top))
                Spacer()
                
                VStack{
                    MainButton(title: "链接Twitter账户",iconname: "TwitterLogo") {
                        linkTwitter()
                    }
                    Text("基于Twitter, Inc. Api-V2.0打造")
                        .mFont(style: .Body_15_R,color: .fc3)
                }
                .ifshow(step == 0, animation: .spring(), transition: .move(edge: .bottom))
                
            }
            .padding(.all,24)
            
            
            Color.MainColor
                .frame( maxHeight: step > 1 ? .infinity : 12 )
                .overlay(loginWebView)
                .clipShape( RoundedRectangle(cornerRadius: 24, style: .continuous))
                .padding(.horizontal,12)
                .shadow(color: step > 2 ? .fc1.opacity(0.2) : .clear, radius: 12, x: 0, y: 2)
                .ifshow(step > 0, animation: .spring(), transition: .move(edge: .leading))
            
            
        }
    }
    
    
    ///WKWebView
    var loginWebView : some View {
        ZStack{
            MTWebView(urlString: "https://twitter.com/i/oauth2/authorize?response_type=code&client_id=\(APP_ClientID)&redirect_uri=\(APP_Redirecturl)&scope=tweet.read%20tweet.write%20tweet.moderate.write%20users.read%20follows.read%20follows.write%20offline.access%20space.read%20mute.read%20mute.write%20like.read%20like.write%20list.read%20list.write%20block.read%20block.write%20&state=state&code_challenge=challenge&code_challenge_method=plain")
                .clipped()
                .ifshow(step == 3)
            ProgressView()
                .ifshow(step == 2)
            closeBtn
        }
    }
    
    ///关闭按钮
    var closeBtn : some View {
        Button {
            withAnimation(.spring()){
                step = 0
            }
        } label: {
            ICON(sysname: "xmark",fcolor: .fc1,size: 16,fontWeight: .semibold)
                .padding(.all,8)
                .background(BlurView().clipShape(Circle()))
        }
        .MoveTo(.topTrailing)
        .padding()
        .ifshow(step >= 3)
    }
    
    ///点击链接按钮
    func linkTwitter(){
        withAnimation {
            madasoft()
            step += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    step += 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        step += 1
                    }
                }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
//
//struct MTWebView_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}
