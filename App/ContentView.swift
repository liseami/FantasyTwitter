//
//  ContentView.swift
//  Shared
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var uistate = UIState.shared

    var body: some View {
        
    
        NavigationView {
            ZStack{
                Color.BackGround.ignoresSafeArea()
                switch uistate.TabbarIndex{
                    
                ///主页面
                case .Timeline :  TimeLineView()
                case .Poluar   :  PolularView()
                case .Search   :  SearchView()
                case .Message  :  InBoxView()
                    
                }
            }
            ///Toolbar
            .toolbar {MainToolBar}
            ///Navilink
            ///个人主页
            .PF_Navilink(isPresented: $uistate.showProfileView) {
                ProFileView()
            }
            ///Post详情
            .PF_Navilink(isPresented: $uistate.showPostDetailView, content: {
                PostDetailView()
            })
           
            
        }
        .overlay( Tabbar())
        .PF_FullScreen(isPresented: $uistate.showSettingView) {
        } content: {
            SettingView()
        }
        .accentColor(.fc1)
        .navigationViewStyle(StackNavigationViewStyle())
        .PF_OverProgressView(loadingState: .none)
        
    }
    
    ///ToolBar
    var MainToolBar :  some ToolbarContent {
        Group{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    uistate.showSettingView.toggle()
                } label: {
                    ICON(name:"Gear",fcolor: .fc1){
                        uistate.showSettingView.toggle()
                    }
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    uistate.showProfileView.toggle()
                } label: {
                    PF_AsyncImage(UIImage(named: "liseamiAvatar"))
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
            }
        
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
