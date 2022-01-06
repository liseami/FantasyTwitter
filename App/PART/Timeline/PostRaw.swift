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
                    .multilineTextAlignment(.leading)
                    .PF_Leading()
                    .mFont(style: .Title_17_R,color: .fc1)
            }
        }
        .padding(.all,16)
        .background(Color.Card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct PostRaw_Previews: PreviewProvider {
    static var previews: some View {
        PostRaw(username: "Liseami", usernickname: "liseami1", postcontent: randomString(140))
            .previewLayout(.sizeThatFits)
        ZStack{
            Color.BackGround.ignoresSafeArea()
            PostRaw(username: "Liseami", usernickname: "liseami1", postcontent: randomString(140))
                .padding(.all,12)
        }
 
       
    }
}
