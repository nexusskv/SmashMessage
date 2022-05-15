//
//  Definitions.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation

let kTriggerName = "messagetrigger"
let kTriggerScript: String = "document.getElementById('messagetrigger').addEventListener('click', function () { window.webkit.messageHandlers.messagetrigger.postMessage('display');});"
