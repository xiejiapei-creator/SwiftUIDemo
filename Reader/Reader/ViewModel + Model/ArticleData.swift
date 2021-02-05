//
//  ArticleData.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/20.
//

import Foundation

// MARK: - Model
struct Article: Codable, Identifiable
{
    var id: Int
    var title: String
    var body: String
}

// MARK: - ViewModel
class Articles: ObservableObject
{
    @Published var articles = [Article]()
    
    init()
    {
        let url = URL(string: "https://www.legolas.me/s/articles.json")!
        URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            DispatchQueue.main.async
            {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
            }
        }.resume()
    }
}


