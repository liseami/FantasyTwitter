//
//  WebView.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/7.
//

 
import WebKit


struct MTWebView: View {
    let urlString: String
    @StateObject var webvm = MTWebViewModel()
    //    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0.0) {
            ProgressView(value: webvm.estimatedProgress, total: 1)
                .progressViewStyle(.linear)
            
            MTWebViewRepresentable(webView: webvm.webView)
                .ignoresSafeArea(edges: .bottom)
        }
        .navigationBarTitle(webvm.title ?? "loading...")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            webvm.loadUrl(urlString: urlString)
        }
    }
}





//MARK: - 视图提供者
struct MTWebViewRepresentable : UIViewRepresentable {
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
    
}

class MTWebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .other{
            if let redirectedUrl = navigationAction.request.url{
//                    获取重定向时推特发来的code
                if let code = redirectedUrl.queryParameters?.first(where: { somep in
                    somep.key == "code"
                })?.value
                {
                    print("🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘")
                    print(code)
                    LoginViewModel.share.code_of_APP_Redirecturl = code
                    print("🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘🐘")
                }
            }
            decisionHandler(.allow)
            return
        }
        decisionHandler(.allow)
    }
}

class MTWebViewModel: NSObject, ObservableObject {
    let webView: WKWebView
    
    private let navigationDelegate: MTWebViewNavigationDelegate
    
    override init() {
        //        self.urlString = urlString
        let configuration = WKWebViewConfiguration()
        //        configuration.websiteDataStore = .nonPersistent()
        webView = WKWebView(frame: .zero, configuration: configuration)
        navigationDelegate = MTWebViewNavigationDelegate()
        webView.navigationDelegate = navigationDelegate
        webView.scrollView.showsVerticalScrollIndicator = false
        super.init()
        setupBindings()
    }
    
    @Published var urlString: String = ""
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var isLoading: Bool = false
    @Published var estimatedProgress: Double = 0
    @Published var title: String? = nil
    
    
    private func setupBindings() {
        webView.publisher(for: \.canGoBack)
            .assign(to: &$canGoBack)
        
        webView.publisher(for: \.canGoForward)
            .assign(to: &$canGoForward)
        
        webView.publisher(for: \.isLoading)
            .assign(to: &$isLoading)
        
        webView.publisher(for: \.estimatedProgress)
            .assign(to: &$estimatedProgress)
        
        webView.publisher(for: \.title)
            .assign(to: &$title)
        
    }
    
    func loadUrl(urlString: String) {
        self.urlString = urlString
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    
    
    func goForward() {
        webView.goForward()
    }
    
    func goBack() {
        webView.goBack()
    }
}


