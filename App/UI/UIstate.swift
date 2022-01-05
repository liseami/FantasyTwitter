//
//  UIstate.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

class UIState : ObservableObject{
    
    static let shared = UIState()
    
    let userdefult = UserDefaults.standard
   
    // Tabar
    @Published var TabbarIndex : tabbarItemEnum = .Timeline
    @Published var TabbarProgress : Double = 0.618
    var tabbarItem : [tabbarItemEnum] = [.Timeline,.Search,.Message,.Poluar]
    
    enum tabbarItemEnum {
        case Timeline
        case Search
        case Message
        case Poluar
        var iconname : String{
            switch self {
            case .Timeline:
                return "Home"
            case .Search:
                return "Customize"
            case .Message:
                return "Search"
            case .Poluar :
                return "Mail"
            }
        }
    }
    
    ///hometool
    @Published var showSettingView : Bool = false
    @Published var showProfileView : Bool = false
}
