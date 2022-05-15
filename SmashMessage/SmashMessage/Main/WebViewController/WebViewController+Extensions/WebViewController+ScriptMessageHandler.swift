//
//  WebViewController+ScriptMessageHandler.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation
import WebKit


extension WebViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        actionsHandler?.handleScriptMessage(message, vc: self)
    }
}
