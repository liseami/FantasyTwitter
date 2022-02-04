//
//  TimeLineView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI

 
  

struct HomeView: View {
    @State private var offset : CGFloat = 0
    @ObservedObject var uistate = UIState.shared
    @ObservedObject var vm = HomeViewModel.share
    
    var body: some View {
        
        PF_OffsetScrollView(offset: $offset, content: {
           
            LazyVStack {

                Spacer().frame(width: 1, height: 1)
                if let list = vm.home_timeline{
                    ForEach(list,id:\.self.id){ tweet in
                        PostRaw(username: randomString(3), usernickname: "liseami", postcontent: tweet.text ?? "")
                    }
                }
              
                Spacer().frame(width: 1, height: 80)
            }
            .padding(.all,12)
        })
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navitop(style: .large) {
            BlurView()
        } TopCenterView: {
            Image("Logo")
                .resizable()
                .frame(width: 28, height: 28)
                .scaledToFit()
        }
        .onAppear {
            UserManager.share.getme()
            vm.get_hoem_timeline()
        }
    }
  
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
