//
//  Tweet.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation


struct Tweet : Convertible{
   var created_at  : String? //Wed Oct 10 20:19:24 +0000 2018",
   var id : Int?
   var id_str  : String? //1050118621198921728",
   var text  : String? //To make room for more expression, we9aXm",
    var truncated : Bool? = false
    var entities : String?
   var source  : String? //<a her.co",
   var in_reply_to_status_id  : String?
   var in_reply_to_status_id_str  : String?
   var in_reply_to_user_id  : String?
   var in_reply_to_user_id_str  : String?
   var in_reply_to_screen_name  : String?
    var user : User?
   var geo  : String?
   var coordinates  : String?
   var place  : String?
   var contributors  : String?
   var is_quote_status  : Bool? = false  //,
    var retweet_count : Int?
   var favorite_count : Int?
   var favorited  : Bool? = false  //,
   var retweeted  : Bool? = false  //,
   var possibly_sensitive  : Bool? = false  //,
   var possibly_sensitive_appealable  : Bool? = false  //,
   var lang  : String? //en"
}

struct User : Convertible{
    var id : Int?
   var id_str: String? //6253282",
   var name: String? //TwitterAPI",
   var screen_name: String? //TwitterAPI",
   var location: String? //SanFrancisco,CA ",
   var description: String? //TheRealTwitter?It'sonmywebsite.",
   var url: String? //https: //t.co/8IkCzCDr19",
   var entities : String?
   var protected: Bool? = false
   var followers_count  : Int?
   var friends_count : Int?
   var listed_count : Int?
   var created_at: String? //WedMay2306: 01: 13+00002007",
   var favourites_count : Int?
   var utc_offset: String? //
   var time_zone: String? //
   var geo_enabled: String? //
    var verified:Bool? = false
   var statuses_count : Int?
   var lang: String? //
   var contributors_enabled: String? //
   var is_translator: String? //
   var is_translation_enabled: String? //
   var profile_background_color: String? //
   var profile_background_image_url: String? //
   var profile_background_image_url_https: String? //
   var profile_background_tile: String? //
   var profile_image_url: String? //
   var profile_image_url_https: String? //https: //pbs.twimg.com/profile_images/942858479592554497/BbazLO9L_normal.jpg",
   var profile_banner_url: String? //https: //pbs.twimg.com/profile_banners/6253282/1497491515",
   var profile_link_color: String? //
   var profile_sidebar_border_color: String? //
   var profile_sidebar_fill_color: String? //
   var profile_text_color: String? //
   var profile_use_background_image: String? //
   var has_extended_profile: String? //
   var default_profile: Bool? = false
   var default_profile_image: Bool? = false
   var following: String? //
   var follow_request_sent: String? //
   var notifications: String? //
   var translator_type: String? //null"
}
