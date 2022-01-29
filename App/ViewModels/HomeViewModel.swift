//
//  HomeViewModel.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation


class HomeViewModel : ObservableObject {
    static let share = HomeViewModel()
    @Published var home_timeline : [Tweet]?
    
    func get_hoem_timeline(){
        let target = TimeLineApi.getHomeTimeline
        Networking.requestArray(target, modeType: Tweet.self) { r, tweets in
            self.home_timeline = tweets ?? []
        }
    }
}

