//
//  WebService.swift
//  GoodNews
//
//  Created by Ivan Stoilov on 25.05.23.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                
                completion(nil)
            } else if let data = data {
                let articles = try? JSONDecoder().decode(ArticleList.self, from: data).articles
                
                guard let articles = articles else {
                    completion(nil)
                    
                    return
                }
                
                completion(articles)
            }
        }.resume()
    }
}
