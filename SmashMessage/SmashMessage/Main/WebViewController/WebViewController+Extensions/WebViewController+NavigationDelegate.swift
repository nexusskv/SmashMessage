//
//  WebViewController+NavigationDelegate.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation
import WebKit


extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
