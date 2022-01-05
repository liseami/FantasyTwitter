//
//  TimeLineView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/5.
//

import SwiftUI

struct TimeLineView: View {
    @State private var offset : CGFloat = 0
    var body: some View {
        PF_OffsetScrollView(offset: $offset) {
            Text("TimeLine")
        }
        .PF_Navitop(style: .large) {
            BlurView()
        } TopCenterView: {
            Image("Logo")
                .resizable()
                .frame(width: 28, height: 28)
                .scaledToFit()
        }
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView()
    }
}
