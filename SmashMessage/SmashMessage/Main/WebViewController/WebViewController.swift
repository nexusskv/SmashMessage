//
//  WebViewController.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import UIKit
import WebKit


class WebViewController: UIViewController {
    var formWebView: WKWebView?
    var viewModel: WebViewModel?
    var actionsHandler: WebActionsHandler?
    
    
    override func viewDidLoad() {
        makeObjects()
        
        super.viewDidLoad()
        
        viewModel?.loadWebView(self)
    }

    private func makeObjects() {
        viewModel       = WebViewModel()
        actionsHandler  = WebActionsHandler()
    }
}


