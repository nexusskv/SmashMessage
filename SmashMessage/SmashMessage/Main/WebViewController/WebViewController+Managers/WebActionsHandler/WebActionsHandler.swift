//
//  WebActionsHandler.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation
import WebKit
import UIKit


class WebActionsHandler {
    
    func handleScriptMessage(_ message: WKScriptMessage, vc: WebViewController) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.requestNotificationAuthorization()
        }
    }
}
