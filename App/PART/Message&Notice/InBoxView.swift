//
//  Message.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI

struct InBoxView: View {
    @State private var offset : CGFloat = 0
    var body: some View {
        PF_OffsetScrollView(offset: $offset) {
            
            LazyVStack{
                ForEach(0 ..< 5) { item in
                    message
                }
            }
            .padding()
            
           
        }
        .navigationTitle(Text("InBox"))
    }
    
    var message : some View {
        
        
        HStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top,  spacing:12){
                Image("liseamiAvatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: SW * 0.12, height: SW * 0.12)
                    .clipShape(Circle())
               
                VStack(alignment: .leading, spacing: 6){
                    Text("Liseami")
                        .mFont(style: .Body_15_B,color: .fc1)
                    
                    Text(randomString(Int.random(in: 0...120)))
                        .mFont(style: .Body_15_R,color: .fc2)
                }
           
                
                Spacer()
            }
            Text("12:21")
                .mFont(style: .Body_13_R,color: .fc3)
        }
           
        
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        InBoxView()
    }
}
