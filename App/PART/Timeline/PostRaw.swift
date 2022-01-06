//
//  PostView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/6.
//

import SwiftUI

struct PostRaw: View {
    let username : String
    let usernickname : String
    let postcontent : String
    
    var body: some View {
        HStack(alignment: .top,  spacing:12){
            Image("liseamiAvatar")
                .resizable()
                .scaledToFill()
                .frame(width: SW * 0.12, height: SW * 0.12)
                .clipShape(Circle())
            VStack(alignment: .leading,spacing:6){
                HStack(alignment: .center, spacing:6){
                    Text(username)
                        .mFont(style: .Title_17_B,color: .fc1)
                    Text("@" + usernickname)
                        .mFont(style: .Title_17_R,color: .fc2)
                }
                Text(postcontent)
                    .PF_Leading()
                    .mFont(style: .Title_17_R,color: .fc1)
            }
        }
        .padding(.all,16)
        .background(Color.back1)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
