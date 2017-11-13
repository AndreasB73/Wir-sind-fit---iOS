//
//  WebsiteViewController.swift
//  Wir sind fit!
//
//  Created by Andreas Bachmaier on 13.11.17.
//  Copyright © 2017 Andreas Bachmaier. All rights reserved.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController {

    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string:"https://www.wirsindfit.at/")
        let req = URLRequest(url: url!)
        self.webView.loadRequest(req)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
