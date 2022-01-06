//
//  SearchInputView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/6.
//

import SwiftUI


class SearchManager : ObservableObject{
    
    static let shared  = SearchManager()
    
    
    enum searchResultSwitch : MTPageSegmentProtocol {
        case top
        case latest
        case people
        case photos
        case videos
        case space
       
        var showText: String{
            switch self {
            case .top:
               return "热门"
            case .latest:
                return "最新"
            case .people:
                return "用户"
            case .photos:
                return "照片"
            case .videos:
                return "视频"
            case .space:
                return "空间"
            }
        }
    }
    
    @Published var searchResultTab : searchResultSwitch = .top
    var tabitems : [searchResultSwitch] = [.top,.latest,.people,.photos,.videos,.space]
}


struct SearchInputView: View {
    @ObservedObject var vm = SearchManager.shared
    
    @State private var offset : CGFloat = 0
    @State private var pageIndex : Int = 0
    
    @State private var searchContext : String = ""
    @State private var firstResponder : Bool = true
    @Binding var starttosearch : Bool
    var body: some View {
        

        VStack{
            HStack{
                PF_TextField(text: $searchContext, isFirstResponder: $firstResponder){
                    $0.textAlignment = .left
                    $0.textColor = UIColor(Color.fc1)
                    $0.font = UIFont.systemFont(ofSize: 17)
                    $0.placeholder = "搜索Twitter"
                }
                .padding(.all,14)
                .frame(height: 36)
                .background(Color.back1
                .frame(height: 36))
                .clipShape(Capsule(style: .continuous))
                Spacer()
               
                Button("取消"){
                    starttosearch = false
                }
                .mFont(style: .Title_17_R,color: .fc2)
            }
            
            
            VStack(spacing:0){
                MT_PageSegmentView(titles: vm.tabitems, offset: $offset)
                //Text("\(Int(floor(offset + 0.5) / ScreenWidth()))")
                MT_PageScrollowView(offset: $offset) {
                    mainViews
                }
            }
            .frame(width: SW)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("助推燃料"))
            
            
            Spacer()
          
            
        }
        .padding(.all,12)
        .navigationBarHidden(true)
        
        
            
    }
    
    @ViewBuilder
    var mainViews : some View {
        HStack(spacing: 0) {
            Group {
               Text("最热")
                Text("最新")
                Text("人物")
                Text("照片")
                Text("视频")
                Text("Space")
            }
            .frame(width: SW)
            .onChange(of: offset) { value in
                self.pageIndex = Int(floor(offset + 0.5) / SW)
            }
        }
    }
    
}

struct SearchInputView_Previews: PreviewProvider {
    static var previews: some View {
        SearchInputView(starttosearch: .constant(true))
    }
}
