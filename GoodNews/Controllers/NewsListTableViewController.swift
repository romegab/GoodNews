//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Ivan Stoilov on 24.05.23.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
