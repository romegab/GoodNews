//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Ivan Stoilov on 24.05.23.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us$apiKey=6d4309c0f29e463aa255e1b70b70258f") else {
            return
        }
        
        WebService().getArticles(url: url) {[weak self] articles in
            guard let articles = articles else {
                return
            }
            
            self?.articleListViewModel = ArticleListViewModel(articles: articles)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let articleListViewModel = articleListViewModel else {
            return 0
        }
        
        return articleListViewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articleListViewModel = articleListViewModel else {
            return 0
        }
        
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ArticleTableViewCell",
            for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell is not found")
        }
                
        cell.article = articleListViewModel?.articleAtIndex(indexPath.row)
        
        return cell
    }
    
}
