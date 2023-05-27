//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by Ivan Stoilov on 25.05.23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    public var numberOfSection: Int {
        return 1
    }
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        
        return ArticleViewModel(article)
    }
}
