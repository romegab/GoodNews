//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Ivan Stoilov on 25.05.23.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    var title: String {
        return article.title
    }
    var description: String {
        return article.description
    }
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
