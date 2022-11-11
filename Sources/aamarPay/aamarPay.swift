#if canImport(UIKit)

import UIKit

#endif
import WebKit
open class aamarPay: UIViewController {
       
    let webView = WKWebView()
    public let screen = UIStoryboard(name: "aamarPay", bundle: Bundle.module).instantiateInitialViewController()!

    override open func viewDidLoad(){
        super.viewDidLoad()
        view?.addSubview(webView)
        
        guard let url = URL(string: "https://google.com") else {
            return
        }
        webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        webView.load(URLRequest(url: url))
        
    }
    
    
    override open func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let key = change?[NSKeyValueChangeKey.newKey] {
           
            
            if(webView.url!.absoluteString.contains("aamarpay")){
                
                screen.dismiss(animated: true,completion: nil)
            }
            
            print("current url \(webView.url?.absoluteString)")
           }
       
    }
    
    public func pay(){
       
        present(screen, animated: true, completion: nil)
    }
}
