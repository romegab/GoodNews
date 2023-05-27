//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Ivan Stoilov on 27.05.23.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    var article: ArticleViewModel? {
        didSet {
            setData()
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private func setData() {
        guard let article = article else {
            return
        }
        
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description
    }
    
}
