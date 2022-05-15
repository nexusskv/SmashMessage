//
//  WebViewModel.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation
import UIKit
import WebKit


class WebViewModel {
    
    func loadWebView(_ vc: WebViewController) {
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            vc.formWebView = WKWebView(frame: UIScreen.main.bounds, configuration: makeWebViewConfig(vc))
            
            if let web = vc.formWebView {
                web.navigationDelegate                  = vc
                web.allowsBackForwardNavigationGestures = true
                
                if #available(iOS 14, *) {
                    let preferences = WKWebpagePreferences()
                    preferences.preferredContentMode    = .mobile
                    preferences.allowsContentJavaScript = true
                    web.configuration.defaultWebpagePreferences = preferences
                } else {
                    web.configuration.preferences.javaScriptEnabled = true
                }

                web.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
                
                vc.view.addSubview(web)
                
                web.loadFileURL(url, allowingReadAccessTo: url)
                
                let webRequest = URLRequest(url: url)
                
                web.load(webRequest)
            }
        } else {
            print("Error -> Html file not found!")
        }
    }
    
    private func makeWebViewConfig(_ vc: WebViewController) -> WKWebViewConfiguration {
        let webConfig       = WKWebViewConfiguration()
        let userController  = WKUserContentController()

        userController.add(vc, name: kTriggerName)
        
        let userScript = WKUserScript(source: kTriggerScript,
                                      injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: false)
        
        userController.addUserScript(userScript)
        
        
        webConfig.userContentController = userController
        
        return webConfig
    }
}
