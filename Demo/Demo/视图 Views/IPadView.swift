//
//  IPadView.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/7.
//

import SwiftUI

struct IPadView: View
{
    var body: some View
    {
        NavigationView
        {
            List()
            {
                Button(action: {
                    
                }, label: {
                    Label("推荐", systemImage: "flame")
                        .font(.system(size: 22, weight: .semibold))
                })
                
                Button(action: {
                    
                }, label: {
                    Label("手机", systemImage: "iphone")
                        .font(.system(size: 22, weight: .semibold))
                })
                
                Button(action: {

                }, label: {
                    Label("电脑", systemImage: "pc")
                        .font(.system(size: 22, weight: .semibold))
                })
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct IPadView_Previews: PreviewProvider
{
    static var previews: some View
    {
        IPadView()
    }
}



