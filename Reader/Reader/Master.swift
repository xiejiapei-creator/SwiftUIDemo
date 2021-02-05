//
//  ContentView.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/20.
//

import SwiftUI

// MARK: - View 
struct Master: View
{
    @StateObject var data = Articles()
    //@State var darkMode = false
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View
    {
        NavigationView
        {
            List(data.articles)
            { (article) in
                NavigationLink(destination: Detail(article: article))
                {
                    Row(article: article)
                }
            }
            .navigationTitle("编辑推荐")
            .toolbar
            {
                Setting(darkMode: $darkMode)
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Master()
    }
}






