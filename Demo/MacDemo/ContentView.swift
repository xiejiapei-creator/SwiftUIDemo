//
//  ContentView.swift
//  MacDemo
//
//  Created by 谢佳培 on 2020/12/7.
//

import SwiftUI

struct ContentView: View
{
    @State private var themeColor = Color(.sRGB, red: 1, green: 1, blue: 0)
    
    var body: some View
    {
        HSplitView
        {
            ColorPicker("主题色", selection: $themeColor)
                .padding()
            
            Spacer()
            
            Menu("菜单")
            {
                Button("打开", action: { })
                Menu("移除")
                {
                    Button("永久删除", action: { })
                    Button("隐藏", action: { })
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
