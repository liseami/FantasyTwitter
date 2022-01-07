//
//  TimeLineView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI
import FantasyUI

struct TimeLineView: View {
    @State private var offset : CGFloat = 0
    @ObservedObject var uistate = UIState.shared
    var body: some View {
        
        
        Group{
            if #available(iOS 15.0, *) {
                timeLineList
                    .listStyle(.plain)
                .refreshable {
                    /// 刷新列表
                }
            }else{
                VStack{
                    timeLineList
                        .listStyle(SidebarListStyle())
                }
              
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navitop(style: .large) {
            BlurView()
        } TopCenterView: {
            Image("Logo")
                .resizable()
                .frame(width: 28, height: 28)
                .scaledToFit()
        }
    }
    
    var timeLineList : some View {
        
        List {
            Spacer().frame(width: 1, height: 1)
                .listRowInsets(EdgeInsets(top: -24, leading: 0, bottom: -24, trailing: 0))
                .listRowBackground(Color.clear)
            
            ForEach(0..<12){ index in
                if #available(iOS 15.0, *) {
                    PostRaw(username: randomString(3), usernickname: "liseami", postcontent: randomString(Int.random(in: 12...140)))
                    .listRowInsets(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                    .listRowBackground(Color.clear)
                }
                else{
                    PostRaw(username: randomString(3), usernickname: "liseami", postcontent: randomString(Int.random(in: 12...140)))
                    .listRowInsets(EdgeInsets(top: 6, leading: -8, bottom: 6, trailing: -8))
                    .listRowBackground(Color.clear)
                }
            }
            Spacer().frame(width: 1, height: 80)
                .listRowInsets(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                .listRowBackground(Color.clear)
        }
        
        
       
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
